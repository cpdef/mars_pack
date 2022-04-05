
minetest.register_node("marssurvive:trapdoor_1", {
	description = "Trap door",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.375, -0.5, 0.5, -0.4375, 0.5},
			{-0.5, 0.4375, -0.5, 0.5, 0.375, 0.5},
		}
	},
	tiles = {"marssurvive_shieldblock.png","marssurvive_shieldblock.png","marssurvive_door2.png","marssurvive_warntape.png","marssurvive_door2.png","marssurvive_door2_2.png",},
	groups = {cracky = 1, level = 2, not_in_creative_inventory=0},
	sounds = default.node_sound_stone_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	climbable = true,
on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	minetest.swap_node(pos, {name="marssurvive:trapdoor_2", param2=minetest.get_node(pos).param2})
	minetest.sound_play("marssurvive_door2", {pos=pos, gain = 1, max_hear_distance = 5})
	minetest.after(4, function(pos)
		if minetest.get_node(pos).name=="marssurvive:trapdoor_2" then
			minetest.swap_node(pos, {name="marssurvive:trapdoor_1", param2=minetest.get_node(pos).param2})
			minetest.sound_play("marssurvive_door2", {pos=pos, gain = 1, max_hear_distance = 5})
		end
	end, pos)


	end,
})

minetest.register_node("marssurvive:trapdoor_2", {
	description = "Trap door (open)",
	drop="marssurvive:trapdoor_1",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.375, -0.5, 1.5, -0.4375, 0.5},
			{0.375, 0.4375, -0.5, 1.5, 0.375, 0.5},
		}
	},
	tiles = {"marssurvive_shieldblock.png","marssurvive_shieldblock.png","marssurvive_door2_open.png","marssurvive_warntape.png","marssurvive_door2_open.png","marssurvive_door2_2_open.png",},
	groups = {cracky = 1, level = 2, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	climbable = true,
on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local p={x=pos.x,y=pos.y+1,z=pos.z}
	minetest.sound_play("marssurvive_door2", {pos=pos, gain = 1, max_hear_distance = 5})
	minetest.swap_node(pos, {name="marssurvive:trapdoor_1", param2=minetest.get_node(pos).param2})
	end,
})

minetest.register_node("marssurvive:clight", {
	description = "Ceiling light",
	tiles = {"default_cloud.png"},
	drawtype = "nodebox",
	groups = {snappy = 3, not_in_creative_inventory=0},
	sounds = default.node_sound_glass_defaults(),
	is_ground_content = false,
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {type="fixed",fixed={-0.2,0.4,-0.4,0.2,0.6,0.4}},
	light_source=14,
})

minetest.register_node("marssurvive:door2_1", {
	description = "Door",
	drop="marssurvive:door2_1",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		}
	},
	tiles = {"marssurvive_warntape.png","marssurvive_warntape.png","marssurvive_door2.png","marssurvive_warntape.png","marssurvive_door2.png","marssurvive_door2_2.png",},
	groups = {cracky = 1, level = 2, not_in_creative_inventory=0},
	sounds = default.node_sound_stone_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
after_place_node = function(pos, placer, itemstack, pointed_thing)
	local p={x=pos.x,y=pos.y+1,z=pos.z}
	if minetest.registered_nodes[minetest.get_node(p).name].walkable then
		return false
	else
		minetest.set_node(p, {name = "marssurvive:door2_2",param2=minetest.get_node(pos).param2})
	end
	end,
on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local p={x=pos.x,y=pos.y+1,z=pos.z}
	minetest.swap_node(p, {name="marssurvive:door2_open_2", param2=minetest.get_node(pos).param2})
	minetest.swap_node(pos, {name="marssurvive:door2_open_1", param2=minetest.get_node(pos).param2})
	minetest.sound_play("marssurvive_door2", {pos=pos, gain = 1, max_hear_distance = 5})
	minetest.after(2, function(pos,p)
		if minetest.get_node(pos).name=="marssurvive:door2_open_1" then
			minetest.sound_play("marssurvive_door2", {pos=pos, gain = 1, max_hear_distance = 5})
			minetest.swap_node(p, {name="marssurvive:door2_2", param2=minetest.get_node(pos).param2})
			minetest.swap_node(pos, {name="marssurvive:door2_1", param2=minetest.get_node(pos).param2})
		end
	end, pos,p)
	end,
	after_dig_node = function (pos, name, digger)
		marssurvive.replacenode({x=pos.x,y=pos.y+1,z=pos.z})
	end,
})

minetest.register_node("marssurvive:door2_2", {
	description = "Door 2-1",
	drawtype = "nodebox",
	drop="marssurvive:door2_1",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, 0.5, 0.125},
		}
	},
	tiles = {"marssurvive_warntape.png","marssurvive_warntape.png","marssurvive_door2.png","marssurvive_warntape.png","marssurvive_door2.png","marssurvive_door2_2.png",},
	groups = {cracky = 1, level = 2, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local p={x=pos.x,y=pos.y-1,z=pos.z}
	minetest.swap_node(p, {name="marssurvive:door2_open_1", param2=minetest.get_node(pos).param2})
	minetest.swap_node(pos, {name="marssurvive:door2_open_2", param2=minetest.get_node(pos).param2})
	minetest.sound_play("marssurvive_door2", {pos=pos, gain = 1, max_hear_distance = 5})
	minetest.after(2, function(pos,p)
		if minetest.get_node(pos).name=="marssurvive:door2_open_2" then
			minetest.sound_play("marssurvive_door2", {pos=pos, gain = 1, max_hear_distance = 5})
			minetest.swap_node(p, {name="marssurvive:door2_1", param2=minetest.get_node(pos).param2})
			minetest.swap_node(pos, {name="marssurvive:door2_2", param2=minetest.get_node(pos).param2})
		end
	end, pos,p)
	end,
	after_dig_node = function (pos, name, digger)
		marssurvive.replacenode({x=pos.x,y=pos.y-1,z=pos.z})
	end,
})

minetest.register_node("marssurvive:door2_open_1", {
	description = "Door (open) 2-o-1",
	drop="marssurvive:door2_1",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.41, -0.5, -0.124, 1.41, 0.5, 0.125},
		}
	},
	tiles = {"marssurvive_warntape.png","marssurvive_warntape.png","marssurvive_door2_open.png","marssurvive_warntape.png","marssurvive_door2_open.png","marssurvive_door2_2_open.png",},
	groups = {cracky = 1, level = 2, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local p={x=pos.x,y=pos.y+1,z=pos.z}
	minetest.sound_play("marssurvive_door2", {pos=pos, gain = 1, max_hear_distance = 5})
	minetest.swap_node(p, {name="marssurvive:door2_2", param2=minetest.get_node(pos).param2})
	minetest.swap_node(pos, {name="marssurvive:door2_1", param2=minetest.get_node(pos).param2})
	end,
	after_dig_node = function (pos, name, digger)
		marssurvive.replacenode({x=pos.x,y=pos.y+1,z=pos.z})
	end,
})

minetest.register_node("marssurvive:door2_open_2", {
	description = "Door (open) 2-o-1",
	drawtype = "nodebox",
	drop="marssurvive:door2_1",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{0.41, -0.5, -0.124, 1.41, 0.5, 0.125},
		}
	},
	tiles = {"marssurvive_warntape.png","marssurvive_warntape.png","marssurvive_door2_open.png","marssurvive_warntape.png","marssurvive_door2_open.png","marssurvive_door2_2_open.png",},
	groups = {cracky = 1, level = 2, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
on_rightclick = function(pos, node, player, itemstack, pointed_thing)
	local p={x=pos.x,y=pos.y-1,z=pos.z}
	minetest.sound_play("marssurvive_door2", {pos=pos, gain = 1, max_hear_distance = 5})
	minetest.swap_node(p, {name="marssurvive:door2_1", param2=minetest.get_node(pos).param2})
	minetest.swap_node(pos, {name="marssurvive:door2_2", param2=minetest.get_node(pos).param2})
	end,
	after_dig_node = function (pos, name, digger)
		marssurvive.replacenode({x=pos.x,y=pos.y-1,z=pos.z})
	end,
})

local nodes_g_s={
{"#cf411bff","small",0.25},
{"#cf411bff","medium",0.3},
}

for i = 1, #nodes_g_s, 1 do

minetest.register_node("marssurvive:stone_" .. nodes_g_s[i][2], {
	description = "Stone " .. nodes_g_s[i][2],
	drawtype = "mesh",
	mesh = "stone1.obj",
	visual_scale = nodes_g_s[i][3],
	tiles = {"default_desert_stone.png^[colorize:#cf7d67ff"},
	groups = {dig_immediate=3,not_in_creative_inventory=0,stone=1},
	paramtype = "light",
	paramtype2 = "facedir",
	sounds = default.node_sound_stone_defaults(),
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.-0.25, 0.3}
	},
collision_box = {
		type = "fixed",
		fixed = {{-0.3, -0.5, -0.3, 0.3, 0.-0.25, 0.3},}},
})
end

minetest.register_node("marssurvive:warning", {
	description = "Warning tape block",
	tiles = {"marssurvive_warntape.png"},
	groups = {cracky = 2,},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("marssurvive:ice", {
	description = "Ice",
	tiles = {"default_ice.png^[colorize:#ffffff99"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("marssurvive:shieldblock", {
	description = "Shieldblock",
	tiles = {"marssurvive_shieldblock.png"},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("marssurvive:steelwallblock", {
	description = "Steel wallblock",
	tiles = {"marssurvive_wall.png"},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("marssurvive:clayblock", {
	description = "Clayblock",
	tiles = {"default_clay.png^[colorize:#863710aa"},
	groups = {crumbly = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node(":default:cloud", {
	description = "Cloud",
	tiles = {"default_cloud.png"},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
	groups = {not_in_creative_inventory = 1},
	--drawtype = "airlike",
})

