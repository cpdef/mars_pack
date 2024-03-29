marsair.registered_airleaves = {}
marsair.register_airleaves = function(name, trunk)
	local nodedef = minetest.registered_nodes[name]
	local groups = nodedef.groups
	groups.marsair_leaves = 1
	minetest.override_item(name, {
		groups = groups
	})
	
	local leavedef = {trunk = trunk}
	marsair.registered_airleaves[name] = leavedef
end

minetest.register_abm({
	label = "tree air generation",
	nodenames = {"group:marsair_leaves", },
	neighbors = {"air", "gas:oxygen"},
	interval = marsairconfig.tree_air_time,
	chance = marsairconfig.tree_air_chance,
	action = function(pos)
		local node = minetest.get_node(pos)
		local airleave = marsair.registered_airleaves[node.name]
		if airleave == nil then
			minetest.log('error', 'TREEAIR'..node.name)
			return
		end
		local trunk = marsair.registered_airleaves[node.name].trunk
		local add_oxygen_pos = minetest.find_node_near(pos, 1, "air")
			or minetest.find_node_near(pos, 1, "gas:oxygen")
		
		if type(trunk) == "table" then
			for i, v in pairs(trunk) do
				if minetest.find_node_near(pos, 4, v) then
					gas.balance(add_oxygen_pos, "oxygen", true, 10)
				end
			end
		else
			if minetest.find_node_near(pos, 4, trunk) then
				gas.balance(add_oxygen_pos, "oxygen", true, 10)
			end
		end
	end
})

minetest.register_abm({
	label = "flora air generation",
	nodenames = {"group:flora", "group:plant"},
	neighbors = {"air", "gas:oxygen"},
	interval = marsairconfig.flower_air_time,
	chance = marsairconfig.flower_air_chance,
	action = function(pos)
		local node = minetest.get_node(pos)
		local under = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
		if under.name == "marsair:airmaker" 
			or minetest.get_item_group(node.name, "no_oxygen_production") > 0 then
			return
		end
		gas.balance(pos, "oxygen", true, 8)
	end
})


marsair.register_airleaves("default:leaves", "default:tree")
marsair.register_airleaves("default:bush_leaves", "default:bush_stem")
