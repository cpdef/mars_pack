gas = {definitions={}, max_concentration = 16}

gas.default_def = {
    description = "gas",
    tiles = {"gas.png^[colorize:#E0E0E0CC"},
    on_construct = function(pos)
        gas.set_concentration(pos, gas.get_name(pos), 1)
    end,
    groups = {gas=1},
    paramtype = "light",
    sunlight_propagates = true,
    drawtype = "glasslike",
    buildable_to = true,
    pointable = false,
    diggable = false,
    walkable = false,
    post_effect_color = {a = 100, r = 120, g = 120, b = 120},
    alpha = 20,
}

function gas.get_concentration(pos)
    print("get")
    local meta = minetest.get_meta(pos)
    return meta:get_int("gas:concentration")
end

function gas.set_concentration(pos, gas_name, value)
    print("set")
    local remainder = 0
    if value > gas.max_concentration then
        remainder = value-gas.max_concentration
        value = gas.max_concentration
    end
    if value < 1 then
        if minetest.get_node(pos).name == "gas:"..gas_name then
            minetest.set_node(pos, {name="air"})
            return 0
        end
    end
    local meta = minetest.get_meta(pos)
    meta:set_int("gas:concentration", value)
    meta:set_string("gas:name", gas_name)
    meta:set_int("gas:mod_time", math.floor(os.time()))
    return remainder
end

 
function gas.check_modified(pos)
        local meta = minetest.get_meta(pos)
        if (math.floor(os.time()) - meta:get_int("gas:mod_time")) <= 1 then
            return true
        end
        return false
end

function gas.get_name(pos)
    print("name")
    if (minetest.get_item_group(minetest.get_node(pos).name, "gas") == 0) then
        return nil
    end
    return minetest.get_node(pos).name:sub(5)
end

function gas.add_concentration(pos, gas_name, value)
    print("add")
    local node = minetest.get_node(pos)
    if gas.get_name(pos) ~= nil then
        local meta = minetest.get_meta(pos)
        local concentration = meta:get_int("gas:concentration")
        return gas.set_concentration(pos, gas_name, value+concentration)
    elseif node.name == "air" then
        minetest.set_node(pos, {name = "gas:"..gas_name})
        return gas.set_concentration(pos, gas_name, value)
    end
end

function gas.balance(pos, gas_name, force, additional_gas_count)
        if (additional_gas_count == nil) then
            additional_gas_count = 0
        end

        -- first we check if that gas part was updated shortly, if yes we do nothing
        if gas.check_modified(pos) and (force == nil) then
            return -1
        end

        -- then we get the gas name, and check for all gas of that name in the 3x3x3 Block around it
        local meta = minetest.get_meta(pos)

        local metatable = meta:to_table()
        meta:from_table(metatable)

        if (gas_name == nil) then
            gas_name = meta:get_string("gas:name")
        end
        if not gas_name then
            return -1
        end
        local minp = {x=pos.x-1, y=pos.y-1, z=pos.z-1} 
        local maxp = {x=pos.x+1, y=pos.y+1, z=pos.z+1}
        local nodes = minetest.find_nodes_in_area(minp, maxp, {"gas:"..gas_name, "air"})

        -- next we calculate the average concentration of all the gas in the block
        local count = 0;
        local concentration_sum = 0;
        for _,gas_pos in pairs(nodes) do
            local concentration = minetest.get_meta(gas_pos):get_int("gas:concentration")
            concentration_sum = concentration_sum + concentration
            count = count + 1
        end

        concentration_sum = concentration_sum + additional_gas_count
        local left_over = 0

        local concentration = math.floor(concentration_sum/count)
        local remainder = concentration_sum % count -- we need the remainder to make sure no gas goes lost
        local remaining = 1 -- this var checks if there is still something of the remainder not put into one block
        
        -- we put in every block in the area the average concentration + 1 if
        -- there is something of the remainder remaining
        while nodes do
            -- we choose a random block to prevent
            -- that the behaviour is everytime the same
            if #nodes < 1 then break end
            local rnd = math.random(#nodes)
            local gas_pos = nodes[rnd]
            table.remove(nodes, rnd)


            -- we check whether ther is something of the remainder remaining
            if (remainder <= 0) then remaining = 0 end
            remainder = remainder - 1

            -- we set the new value for the block
            -- if it is to low the gas may perish by a chance of 1/2
            local new_val = concentration+remaining
            if (new_val > 1) or ((new_val == 1) and (math.random(2) == 1)) then
                minetest.set_node(gas_pos, {name="gas:"..gas_name})
                left_over = left_over + gas.set_concentration(gas_pos, gas_name, new_val)
            else
                -- last check to not remove something wrong
                if minetest.get_node(gas_pos).name == "gas:"..gas_name then
                    minetest.set_node(gas_pos, {name="air"})
                end
            end
        end
        return left_over

end

minetest.register_abm(
{
    label = "gas_expand",
    nodenames = {"group:gas"},
    neighbors = {"air"},
    interval = 1,
    chance = 3,
    action = function(pos, node)
        gas.balance(pos)
    end,
})

minetest.register_abm(
{
    label = "gas_inner_balance",
    nodenames = {"group:gas"},
    interval = 5,
    chance = 27,
    action = function(pos, node)
        gas.balance(pos)
    end,
})




--enable_fire = true
--[[local cid_data = {}
local function destroy(drops, pos, cid)
	if minetest.is_protected(pos, "") then
		return
	end
	local def = cid_data[cid]
	if def and def.on_blast then
		def.on_blast(vector.new(pos), 1)
		return
	end
	if def and def.flammable then
		minetest.set_node(pos, fire_node)
	else
		minetest.remove_node(pos)
		if def then
			local node_drops = minetest.get_node_drops(def.name, "")
			for _, item in ipairs(node_drops) do
				add_drop(drops, item)
			end
		end
	end
end

local function explode(pos, radius)
    local pos = vector.round(pos)
    local vm = VoxelManip()
    local pr = PseudoRandom(os.time())
    local p1 = vector.subtract(pos, radius)
    local p2 = vector.add(pos, radius)
    local minp, maxp = vm:read_from_map(p1, p2) 
    local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
    local data = vm:get_data()

    local drops = {}
    local p = {}
    
    local c_air = minetest.get_content_id("air")

    for z = -radius, radius do
        for y = -radius, radius do
        local vi = a:index(pos.x + (-radius), pos.y + y, pos.z + z)
        for x = -radius, radius do
            if (x * x) + (y * y) + (z * z) <=
                (radius * radius) + pr:next(-radius, radius) then
                local cid = data[vi]
                p.x = pos.x + x 
                p.y = pos.y + y 
                p.z = pos.z + z 
                if cid ~= c_air then
                    destroy(drops, p, cid)
                end
            end
            vi = vi + 1 
            end
        end
    end
    return drops
end]]--

if enable_fire then
    minetest.register_abm(
    {
        label = "gas_burn",
        nodenames = {"group:gas"},
        neighbors = {"fire:basic_flame"},
        interval = 1,
        chance = 1,
        action = function(pos, node)
            if minetest.get_item_group(node.name, "flammable") < 1 then return end
            local fire_pos = minetest.find_node_near(pos, 1, {"air"})
            if fire_pos == nil then return end
            minetest.set_node(fire_pos, {name="fire:basic_flame"})
        end,
    })
end

function gas.register_gas(name, def, perish_chance)

    local gas_def = table.copy(gas.default_def)
    for key,value in pairs(def) do
        gas_def[key] = value
    end

    gas_def.groups["gas"] = 1 -- must have

    minetest.register_node(":gas:"..name,gas_def)
    gas.definitions[name] = {}
    gas.definitions[name].perish_chance = perish_chance
end

-- examples, uncomment to test:

-- white gas:
--gas.register_gas("oxygen", {}, 2)

-- blue gas, you can't breath inside:
--gas.register_gas("blue", {tiles = {"gas.png^[colorize:#3333BBCC"}, post_effect_color = {a = 180, r = 20, g = 20, b = 120}, drowning = 1}, 2)

-- green gas: toxic, you get damaged inside
--gas.register_gas("green", {tiles = {"gas.png^[colorize:#33BB33CC"}, post_effect_color = {a = 180, r = 20, g = 120, b = 20}, damage_per_second = 5}, 2)

-- red gas: flammable if you enabled fire
--gas.register_gas("red", {tiles = {"gas.png^[colorize:#bb3333CC"}, post_effect_color = {a = 180, r = 120, g = 20, b = 20}, groups={flammable = 4}}, 2)
