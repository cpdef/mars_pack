-- checks if the area is too big or if its outside in 14 directions
marsair.radius = 21

--check if outside or inside
marsair.is_inside = function(pos)
	--TODO: make this better understandable!
	--TODO: use raycasting
	local ch={xp=1,xm=1,yp=1,ym=1,zp=1,zm=1, 
			OOO=1,IOO=1,OIO=1,IIO=1, 
			OOI=1,IOI=1,OII=1,III=1,all=14}
			
	for rad=1,marsair.radius-2,1 do
		--p=plus m=minus
		if ch.xp==1 	and 	minetest.get_node(	{x=pos.x+rad,	y=pos.y,		z=pos.z     }).name~="air" then ch.xp=0 ch.all=ch.all-1 end
		if ch.xm==1 	and 	minetest.get_node(	{x=pos.x-rad,	y=pos.y,		z=pos.z     }).name~="air" then ch.xm=0 ch.all=ch.all-1 end
		if ch.zp==1 	and 	minetest.get_node(	{x=pos.x,		y=pos.y,		z=pos.z+rad }).name~="air" then ch.zp=0 ch.all=ch.all-1 end
		if ch.zm==1 	and 	minetest.get_node(	{x=pos.x,		y=pos.y,		z=pos.z-rad   }).name~="air" then ch.zm=0 ch.all=ch.all-1 end
		if ch.yp==1 	and 	minetest.get_node(	{x=pos.x,		y=pos.y+rad,	z=pos.z     }).name~="air" then ch.yp=0 ch.all=ch.all-1 end
		if ch.ym==1 	and 	minetest.get_node(	{x=pos.x,		y=pos.y-rad,	z=pos.z     }).name~="air" then ch.ym=0 ch.all=ch.all-1 end
		
		--I=plus O=minus
		--for XYZ
		if ch.III==1 	and 	minetest.get_node(	{x=pos.x+rad,	y=pos.y+rad,	z=pos.z+rad }).name~="air" then ch.III=0 ch.all=ch.all-1 end
		if ch.OII ==1 	and 	minetest.get_node(	{x=pos.x-rad,	y=pos.y+rad,	z=pos.z+rad}).name~="air" then ch.OII=0 ch.all=ch.all-1 end
		if ch.IOI ==1 	and 	minetest.get_node(	{x=pos.x+rad,	y=pos.y-rad,	z=pos.z+rad}).name~="air" then ch.IOI=0 ch.all=ch.all-1 end
		if ch.OOI==1 	and 	minetest.get_node(	{x=pos.x-rad,	y=pos.y-rad,	z=pos.z+rad}).name~="air" then ch.OOI=0 ch.all=ch.all-1 end
		
		if ch.IIO==1 	and 	minetest.get_node(	{x=pos.x+rad,	y=pos.y+rad,	z=pos.z-rad}).name~="air" then ch.IIO=0 ch.all=ch.all-1 end
		if ch.OIO==1 	and 	minetest.get_node(	{x=pos.x-rad,	y=pos.y+rad,	z=pos.z-rad}).name~="air" then ch.OIO=0 ch.all=ch.all-1 end
		if ch.IOO==1 	and 	minetest.get_node(	{x=pos.x+rad,	y=pos.y-rad,	z=pos.z-rad}).name~="air" then ch.IOO=0 ch.all=ch.all-1 end
		if ch.OOO==1 	and 	minetest.get_node(	{x=pos.x-rad,	y=pos.y-rad,	z=pos.z-rad}).name~="air" then ch.OOO=0 ch.all=ch.all-1 end
		
		if ch.all<=0 then return true end
	end
	return false
end

marsair.spread_air = function(pos, count)
	if (count == nil) then
		count = 16*27
	end
	minetest.sound_play("marssurvive_pff", {pos=pos, gain = 1, max_hear_distance = 8,})
	return gas.balance(pos, "oxygen", true, count)
end
--end level system


marsair.use_air_gene = function(pos, player)
	if player and minetest.is_protected(pos,player:get_player_name()) then return end
	
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local needed_air = {name="gas:oxygen", wear=0, metadata=""}
	
	--check for inside/outside (try to not generate outside of a house)
	if not marsair.is_inside(pos) then
		minetest.get_meta(pos):set_string("infotext", "Air Generator [This area is too big (max " .. marsair.radius-1 .. "steps) you have to rebuild]")
		minetest.sound_play("marssurvive_error", {pos=pos, gain = 1, max_hear_distance = 8,})
		return
	end
	
	-- check air count in inventory
	item_list = inv:get_list("main")
	count = 0
	for _, item in pairs(item_list) do
		local name = item:get_name()
		if name == "gas:oxygen" then
			count = count + item:get_count()
		end
	end

	if count < 1 then
		minetest.get_meta(pos):set_string("infotext", "Air Generator [not enought air]")
		minetest.sound_play("marssurvive_error", {pos=pos, gain = 1, max_hear_distance = 8,})
		return
	end

	needed_air.count = count - marsair.spread_air(pos, count)

	minetest.get_meta(pos):set_string("infotext", "Air Generator")
	minetest.sound_play("marssurvive_pff", {pos=pos, gain = 1, max_hear_distance = 8,})
	inv:remove_item("main", needed_air)
end


--airgen registration
local airgen_side_texture = "mars_airgen.png"
if marsair.pipeworks then
	airgen_side_texture = "mars_airgen_pipe.png"
end

minetest.register_node("marsair:airgen", {
	description = "Air Generator",
	tiles = {"marssurvive_shieldblock.png^default_obsidian_glass.png", 
			{
				image = airgen_side_texture,
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.1
				},
			}
		},
	groups = {dig_immediate=3, tubedevice = 1, tubedevice_receiver = 1},
	sounds = default.node_sound_stone_defaults(),
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_construct = function(pos)
		minetest.get_meta(pos):set_string("infotext", "Air Generator")
		local node = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", 	"invsize[8,9;]"..
								"list[current_name;main;0,1;4,1;]"..
								"list[current_player;main;0,5;8,4;]"..
								"label[0,0;Air Generator]"..
								"button_exit[0,3;3,0.7;generate;generate Air]"..
								"listring[current_player;main]"
		)
		local inv = meta:get_inventory()
		inv:set_size("main", 4)
		
		--for airleak
		meta:set_int("leak", 0)
	end,
	on_receive_fields = function(pos, formname, fields, player)
		if fields.generate then
			marsair.use_air_gene(pos, player)
		end
		--print(pos, dump(player), dump(fields))
	end,
	 tube = {
		insert_object = function(pos, node, stack, direction)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			return inv:add_item("main", stack)
		end,
		can_insert = function(pos, node, stack, direction)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			return inv:room_for_item("main", stack)
		end,
		connect_sides = {left = 1, right = 1, back = 1, front=1, bottom=1},
	},
	after_place_node = marsair.after_place,
	after_dig_node = marsair.after_dig,
	mesecons = {effector = {
		rules = {
			{x=0,  y=0,  z=-1},
			{x=1,  y=0,  z=0},
			{x=-1, y=0,  z=0},
			{x=0,  y=0,  z=1},
		},
		action_on = function (pos, node)
			marsair.use_air_gene(pos, false)
		end,
	}},
})

minetest.register_node("marsair:airgen_admin", {
	description = "Air Generator (Admin)",
	tiles = {"marssurvive_shieldblock.png^default_obsidian_glass.png", 
			{
				image = airgen_side_texture,
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 0.1
				},
			}
		},
	groups = {dig_immediate=3, tubedevice = 1, tubedevice_receiver = 1},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		marsair.spread_air(pos)
		return itemstack
	end,
	mesecons = {effector = {
		rules = {
			{x=0,  y=0,  z=-1},
			{x=1,  y=0,  z=0},
			{x=-1, y=0,  z=0},
			{x=0,  y=0,  z=1},
		},
		action_on = function (pos, node)
			marsair.spread_air(pos, "oxygen", true)
			return
		end,
	}},
})
