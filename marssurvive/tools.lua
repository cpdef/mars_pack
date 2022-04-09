minetest.register_tool("marssurvive:diglazer", {
	description = "Dig laZer",
	range = 11,
	inventory_image = "marssurvive_lazerdig.png",
	on_use = function(itemstack, user, pointed_thing)
		local pos=user:getpos()

		if pointed_thing.type=="nothing" then
			return itemstack
		end

		minetest.sound_play("marssurvive_dig", {pos=pos, gain = 1, max_hear_distance = 5,})
		minetest.sound_play("marssurvive_bullet1", {pos=pos, gain = 1, max_hear_distance = 5,})
		if pointed_thing.type=="object" then
			if not pointed_thing.ref:get_armor_groups().immortal then
				pointed_thing.ref:set_hp(pointed_thing.ref:get_hp()-5)
				pointed_thing.ref:punch(user, {full_punch_interval=1.0,damage_groups={fleshy=4}}, "default:bronze_pick", nil)
			end
			return itemstack
		end
		local name=user:get_player_name()
		local dir = user:get_look_dir()
		pos.y=pos.y+1.5
		for i=1,11,1 do
			local p={x=pos.x+(dir.x*i),y=pos.y+(dir.y*i),z=pos.z+(dir.z*i)}
			if minetest.is_protected(p,name) or minetest.get_meta(p):get_string("infotext")~="" then
				return itemstack
			elseif minetest.registered_nodes[minetest.get_node(p).name].walkable then
				local it=minetest.add_item(p, minetest.get_node(p).name)
				it:setvelocity({x=math.random(-1,1),y=2,z=math.random(-1,1)})
				it:get_luaentity().age=marssurvive.itemdroptime
				marssurvive.replacenode(p)
			end
		end
		return itemstack
	end
})

minetest.register_tool("marssurvive:pointed_pebble", {
	description = "Pointed pebble",
	inventory_image = "marssurvive_pointed_pebble.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=3.60, [2]=4.60}, uses=10},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1, flammable = 2}
})
