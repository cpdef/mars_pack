-- overrides the grow functions, so that they can grow inside of gas

-- New apple tree

function default.grow_new_apple_tree(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/apple_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 3, y = pos.y - 1, z = pos.z - 3},
		path, "random", nil, true)
end


-- New jungle tree

function default.grow_new_jungle_tree(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/jungle_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, true)
end


-- New emergent jungle tree

function default.grow_new_emergent_jungle_tree(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/emergent_jungle_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 3, y = pos.y - 5, z = pos.z - 3},
		path, "random", nil, true)
end


-- New pine tree

function default.grow_new_pine_tree(pos)
	local path
	if math.random() > 0.5 then
		path = minetest.get_modpath("default") ..
			"/schematics/pine_tree_from_sapling.mts"
	else
		path = minetest.get_modpath("default") ..
			"/schematics/small_pine_tree_from_sapling.mts"
	end
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "0", nil, true)
end


-- New snowy pine tree

function default.grow_new_snowy_pine_tree(pos)
	local path
	if math.random() > 0.5 then
		path = minetest.get_modpath("default") ..
			"/schematics/snowy_pine_tree_from_sapling.mts"
	else
		path = minetest.get_modpath("default") ..
			"/schematics/snowy_small_pine_tree_from_sapling.mts"
	end
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, true)
end


-- New acacia tree

function default.grow_new_acacia_tree(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/acacia_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 4, y = pos.y - 1, z = pos.z - 4},
		path, "random", nil, true)
end


-- New aspen tree

function default.grow_new_aspen_tree(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/aspen_tree_from_sapling.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "0", nil, true)
end


-- Bushes do not need 'from sapling' schematic variants because
-- only the stem node is force-placed in the schematic.

-- Bush

function default.grow_bush(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, true)
end

-- Blueberry bush

function default.grow_blueberry_bush(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/blueberry_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y, z = pos.z - 1},
		path, "0", nil, true)
end


-- Acacia bush

function default.grow_acacia_bush(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/acacia_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, true)
end


-- Pine bush

function default.grow_pine_bush(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/pine_bush.mts"
	minetest.place_schematic({x = pos.x - 1, y = pos.y - 1, z = pos.z - 1},
		path, "0", nil, true)
end


-- Large cactus

function default.grow_large_cactus(pos)
	local path = minetest.get_modpath("default") ..
		"/schematics/large_cactus.mts"
	minetest.place_schematic({x = pos.x - 2, y = pos.y - 1, z = pos.z - 2},
		path, "random", nil, true)
end
