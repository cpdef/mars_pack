--NEW (for sp registration)

spacesuit = {breath_timer=0, consume_oxygen_timer=0,skin={},has_spacesuit={},hud={}}
spacesuit.registered_spacesuits = {}
spacesuit.registered_breathable_gas = {}

--sp manipulation
local stack_one_sp = function(inventory)
        return string.sub(inventory:get_stack("spacesuit", 1):get_name(), 1, 12)=="spacesuit:sp"
end

local set_wear_sp = function(inventory, wear)
        local name = inventory:get_stack("spacesuit", 1):get_name()
        inventory:set_stack("spacesuit", 1,ItemStack({name=name,wear=wear}))
end

local player_get_sp = function(inventory)
        return spacesuit.registered_spacesuits[inventory:get_stack("spacesuit", 1):get_name()]
end
	
--skin
local player_attach_sp = function(player)
        local sp=player_get_sp(player:get_inventory())
        spacesuit.skin[player:get_player_name()]=player:get_properties().textures
	player:set_properties({visual = "mesh",textures = sp.textures, visual_size = {x=1, y=1}})
	--armor:
	player:set_armor_groups({fleshy = 100-sp.protection})
end

local player_deattach_sp = function(player)
	local textures = spacesuit.skin[player:get_player_name()]
        spacesuit.skin[player:get_player_name()]=nil
	player:set_properties({visual = "mesh",textures = textures, visual_size = {x=1, y=1}})
	--armor:
	player:set_armor_groups({fleshy = 100})
end



spacesuit.register_spacesuit = function(name, inventory_image, protection, textures)
        local tool_name = "spacesuit:sp" .. name
	spacesuit.registered_spacesuits[tool_name] = {sp_name=name, protection=protection, textures=textures}
	minetest.register_tool(":"..tool_name, {
	        description = "Spacesuit " .. name .. " (wear slot 1)",
	        range = 4,
	        inventory_image = inventory_image,
        })
end

--GASSBOTTLE
minetest.register_node("spacesuit:air_gasbottle", {
	description = "Air gasbottle",
	tiles = {"default_steel_block.png"},
	inventory_image = "gasbottle_full.png",
	drawtype = "nodebox",
	groups = {dig_immediate=3},
	sounds = default.node_sound_stone_defaults(),
	is_ground_content = false,
	--paramtype2 = "facedir",
	paramtype = "light",
	node_box = {
	type="fixed",
	fixed={-0.1,-0.5,-0.1,0.1,0.3,0.1}},
})

minetest.register_craftitem("spacesuit:air_gasbottle_empty", {
        description = "empty Air gassbotte",
        inventory_image = "gasbottle_empty.png",
	on_place = function(itemstack, user, pointed_thing)
		print("click")
		local node = minetest.get_node(pointed_thing.under)
		-- TODO: add function on_spacesuit_refill (returns false if not possible)
		if minetest.get_item_group(n, "breathable_gas_refill") > 0 then
			local refill_func = minetest.registered_nodes[n.name].breathable_gas_refill
			if refill_func(pointed_thing.under, node) then
				itemstack:set_count(itemstack:get_count()-1)
				user:get_inventory():add_item("main", "spacesuit:air_gasbottle")
				return itemstack
			end
		end
	end,
})

--CRAFT


minetest.register_craft({
	output = "spacesuit:air_gasbottle 1",
	recipe = {
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"default:steel_ingot","vessels:steel_bottle","default:steel_ingot"},
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
	}
})

--FUNCTIONS
--[[local drown = function(node, player)
	local bubbles = player:get_breath()
	player:set_breath(bubbles-1)
	if node=="air" then 
		--(no spacesuit and in default air: lose 8 hp)
		player:set_hp(player:get_hp()-8)
	elseif minetest.get_item_group(node, "breathable_gas") == 0 then
		--(no spacesuit and inside something else: lose 1 hp)
		player:set_hp(player:get_hp()-1)
	end
end]]--

local set_hud_hide_value = function(player, value)
	local meta = player:get_meta()
	meta:set_int("spacesuit_hide", value)
end

local get_hud_hide_value = function(player)
	local meta = player:get_meta()
	return meta:get_int("spacesuit_hide")
end

local color = "^[multiply:#008EFF"

local add_hud = function(player)
	local name = player:get_player_name()
	spacesuit.hud[name] = {}
	spacesuit.hud[name].oxy_text = player:hud_add({
		hud_elem_type = "image",
		scale = {x=1,y=1},
		text = "o2_icon.png",
		position = {x=0.2, y=1},
		offset = {x=140, y=-180},
	})
	spacesuit.hud[name].oxy_bar = player:hud_add({
		hud_elem_type = "image",
		scale = {x=1,y=1},
		text = "hud_bar.png"..color,
		position = {x=0.2, y=1},
		offset = {x=0, y=-210},
	})
	spacesuit.hud[name].oxy_digit_1 = player:hud_add({
		hud_elem_type = "image",
		scale = {x=1,y=1},
		text = "hud_number_000.png",
		position = {x=0.2, y=1},
		offset = {x=-20, y=-200},
	})
	spacesuit.hud[name].oxy_digit_2 = player:hud_add({
		hud_elem_type = "image",
		scale = {x=1,y=1},
		text = "hud_number_empty.png",
		position = {x=0.2, y=1},
		offset = {x=30, y=-200},
	})
	spacesuit.hud[name].oxy_digit_3 = player:hud_add({
		hud_elem_type = "image",
		scale = {x=1,y=1},
		text = "hud_number_empty.png",
		position = {x=0.2, y=1},
		offset = {x=80, y=-200},
	})
	spacesuit.hud[name].bar_parts = {}
end

local remove_hud = function(player)
	local name = player:get_player_name()
	player:hud_remove(spacesuit.hud[name].oxy_text)
	player:hud_remove(spacesuit.hud[name].oxy_bar)
	player:hud_remove(spacesuit.hud[name].oxy_digit_1)
	player:hud_remove(spacesuit.hud[name].oxy_digit_2)
	player:hud_remove(spacesuit.hud[name].oxy_digit_3)
	for k,v in pairs(spacesuit.hud[name].bar_parts) do
		player:hud_remove(v)
	end
end

local set_hud = function(player)
	local name = player:get_player_name()
	local inv=player:get_inventory()
	local percent = 0
	local wear_spacesuit = false
	if stack_one_sp(inv) then
		wear = inv:get_stack("spacesuit", 1):get_wear()
		percent = math.ceil(((65534-wear)/65534)*100)
		wear_spacesuit = true
	end

	local hidden = false
	if spacesuit.hud[name] then
		hidden = spacesuit.hud[name].hidden
	else
		add_hud(player)
	end
	local hide_value = get_hud_hide_value(player)
	if (percent > hide_value or not wear_spacesuit) and not hidden then
		remove_hud(player)
		spacesuit.hud[name].hidden = true
		return
	elseif wear_spacesuit and percent <= hide_value and hidden then
		add_hud(player)
		spacesuit.hud[name].hidden = false
	end
	if hidden then
		return
	end

	local display_index = math.ceil(percent*(16/100))
	player:hud_change(spacesuit.hud[name].oxy_bar, "text",
		"hud_bar.png"..color
	)
	for i=1,16 do
		local v = spacesuit.hud[name].bar_parts[i]
		if i > display_index and v ~= nil then
			player:hud_remove(v)
			spacesuit.hud[name].bar_parts[i] = nil
		elseif i <= display_index and v == nil then
			spacesuit.hud[name].bar_parts[i] = player:hud_add({
				hud_elem_type = "image",
				scale = {x=1,y=1},
				text = "hud_"..tostring(i)..".png"..color,
				position = {x=0.2, y=1},
				offset = {x=0, y=-210},
			})
		end
	end
	local digit1 = "hud_number_000.png"
	local digit2 = "hud_number_0.png"
	local digit3 = "hud_number_0.png"
	if percent == 100 then
		digit1 = "hud_number_100.png"
	elseif percent >= 10 then
		digit2 = "hud_number_"..tostring(math.floor(percent/10))..".png"
		digit3 = "hud_number_"..tostring(percent % 10)..".png"
	else
		digit2 = "hud_number_empty.png"
		digit3 = "hud_number_"..tostring(percent)..".png"
	end

	player:hud_change(spacesuit.hud[name].oxy_digit_1, "text", digit1)
	player:hud_change(spacesuit.hud[name].oxy_digit_2, "text", digit2)
	player:hud_change(spacesuit.hud[name].oxy_digit_3, "text", digit3)
end


minetest.register_globalstep(function(dtime)
	spacesuit.breath_timer = spacesuit.breath_timer+dtime
	spacesuit.consume_oxygen_timer = spacesuit.consume_oxygen_timer+dtime

	if spacesuit.breath_timer < 2 then return end
	spacesuit.breath_timer=0

	local consume_oxygen = false
	if spacesuit.consume_oxygen_timer > 10 then
		consume_oxygen = true
		spacesuit.consume_oxygen_timer = 0
	end

	for i, player in pairs(minetest.get_connected_players()) do
		if spacesuit.has_spacesuit[player] == true then
			player:set_breath(11)
			player:hud_set_flags({breathbar=false})
		else
			player:hud_set_flags({breathbar=true})
		end
		print("player breathbar: ", player:hud_get_flags().breathbar)
		spacesuit.has_spacesuit[player] = false
		local pos=player:get_pos()
		pos.y = pos.y+1
		local n = minetest.get_node(pos).name
		local inv=player:get_inventory()
		
		if consume_oxygen then
			set_hud(player)
		end

		if stack_one_sp(inv) then
			local wear = inv:get_stack("spacesuit", 1):get_wear()
			if minetest.get_item_group(n, "breathable_gas") > 0 then
				if consume_oxygen then
					local new_wear = wear-(65534/20)
					if new_wear < 0 then new_wear = 0 end
					set_wear_sp(inv, new_wear)
					gas.add_concentration(pos, "oxygen", -1)
				end
			else
				if wear < 65533 then
					local new_wear=wear+ (65534/900)
					if new_wear >= 65533 then new_wear = 65533 end
					set_wear_sp(inv, new_wear)
					player:set_breath(11)
					spacesuit.has_spacesuit[player] = true
				else
					local bottle = {name="spacesuit:air_gasbottle", count=1, wear=0, metadata=""}
					print('bottle', inv:contains_item("main", bottle))
					if inv:contains_item("main", bottle) then
						local removed = inv:remove_item("main", bottle)
						set_wear_sp(inv, 0)
						removed:set_name(removed:get_name() .. "_empty")
						inv:add_item("main", removed)
						minetest.sound_play("marssurvive_pff", {pos=pos, gain = 1, max_hear_distance = 8,})
						
						if inv:contains_item("main", bottle) then --have one or more bottles 
							minetest.chat_send_player(player:get_player_name(), "Warning: one more air-gasbottle is empty!")		
						else
							minetest.chat_send_player(player:get_player_name(), "Warning: have none air-gasbottle left!")
						end
						spacesuit.has_spacesuit[player] = true
					end
				end
			end
			--skin:
			if (spacesuit.skin[player:get_player_name()] == nil) then
				player_attach_sp(player)
			end
		else
			if (spacesuit.skin[player:get_player_name()] ~= nil) then
				player_deattach_sp(player)
			end
		end
	end
end)

minetest.override_item("air", {
        drowning = 1
})

minetest.register_on_newplayer(function(player)
	local player = player:get_player_name()
	spacesuit.hud[player] = {}
	local inv = player:get_inventory()
	inv:set_size("spacesuit", 1)
	inv:set_stack("spacesuit", 1, {name="spacesuit:sp", count=1, wear=0, metadata=""})
	set_hud_hide_value(player, 100)
end)


minetest.register_on_joinplayer(function(player)
	set_hud(player)
	if stack_one_sp(player:get_inventory()) then
		player_attach_sp(player)
	end
end)

-- clear player data
minetest.register_on_leaveplayer(function(player)
	spacesuit.skin[player:get_player_name()]=nil
end)

sfinv.register_page("spacesuit:inventory", {
	title = "Spacesuit",
	get = function(self, player, context)
		-- formspec default hide value
		local d = get_hud_hide_value(player)
		print("get hide: ", d)
		if d < 0 then
			d = 0
		end
		d = tostring(d)

		local percent = 0
		local inv = player:get_inventory()
		if stack_one_sp(inv) then
			wear = inv:get_stack("spacesuit", 1):get_wear()
			percent = math.ceil(((65534-wear)/65534)*100)
		end
		percent = tostring(percent).."% O2 left"

		local inv = player:get_inventory()
		print(inv:get_size("spacesuit"))
		if (inv:get_size("spacesuit") == 0) then

			inv:set_size("spacesuit", 1)
		end
		return sfinv.make_formspec(player, context,
			"list[current_player;spacesuit;0.1,0.1;1,1;]"..
			"field[3.4,0.4;5,1;hide_value;Value at which Oxygen HUD will be shown:;"..d.."]"..
			"button[3.1,1.1;1,1;set;set]"..
			"button[5.1,1.1;3,1;hide;hide completely]"..
			"label[0.1,1.4;"..percent.."]"..
			"", true)
	end,
	on_player_receive_fields = function(self, player, context, fields)
		local hide_value = tonumber(fields.hide_value)
		if fields.hide then
			hide_value = -1
		elseif hide_value == nil then
			return
		end
		print("set hide: ", hide_value)
		set_hud_hide_value(player, hide_value)
	end
})
print("[MOD] Spacesuit loaded!")
