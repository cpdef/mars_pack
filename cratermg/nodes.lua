--[[
	Crater MG - Crater Map Generator for Minetest
	(c) Pierre-Yves Rollo

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published
	by the Free Software Foundation, either version 2.1 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

local planet_name = "Planet"

-- Basic nodes registration
---------------------------

minetest.register_node("cratermg:stone", {
	description = planet_name.." Stone",
	tiles = {"default_stone.png^[colorize:#F408"},
	groups = {cracky = 3, stone=1},
	drop = "cratermg:sediment",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:sediment", {
	description = planet_name.." Sediments",
	tiles = {"default_cobble.png^[colorize:#F408"},
	groups = {cracky = 3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:dust_frozen", {
	description = "frozen Dust",
	tiles = {"cratermg_frozen_sand.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("cratermg:dust1", {
	description = planet_name.." Dust",
	tiles = {"default_desert_sand.png^[colorize:#F408"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("cratermg:dust2", {
	description = planet_name.." Dust",
	tiles = {"default_desert_sand.png^[colorize:#F308"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("cratermg:dust_pebble", {
	description = planet_name.." Dust",
	tiles = {"cratermg_pebble_sand.png^[colorize:#F208"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("cratermg:ice", {
	description = "Ice",
	tiles = {"default_ice.png^[colorize:#ffffff55"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, cools_lava = 1, slippery = 3},
	sounds = default.node_sound_ice_defaults(),
})

minetest.register_node("cratermg:dry_ice", {
	description = "Dry Ice",
	tiles = {"default_ice.png^[colorize:#ffffff99"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 3, cools_lava = 1, slippery = 3},
	sounds = default.node_sound_ice_defaults(),
})

local pebble_box_1 = {
	type = "fixed",
	fixed = {
		{-0.2, -0.3, -0.2, 0.3, -0.2, 0.3},
		{-0.4, -0.4, -0.4, 0.4, -0.3, 0.4},
		{-0.3, -0.5, -0.3, 0.3, -0.4, 0.3}
	}
}

minetest.register_node("cratermg:pebble", {
	description = "Pebble",
	tiles = {"default_stone.png^[colorize:#F408"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {falling_node=1, dig_immediate=3--not_in_creative_inventory=1
        },
	sunlight_propagates = true,
	selection_box = pebble_box_1,
	collision_box = pebble_box_1,
	node_box = pebble_box_1,
	sounds = default.node_sound_stone_defaults()
})

local pebble_box_2 = {
	type = "fixed",
	fixed = {
		{-0.1, -0.5, -0.2, 0.2, -0.25, 0.3}
	}
}

minetest.register_node("cratermg:pebble_small", {
	description = "Pebble small",
	tiles = {"default_stone.png^[colorize:#F408"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {falling_node=1, dig_immediate=3 --not_in_creative_inventory=1
        },
	sunlight_propagates = true,
	selection_box = pebble_box_2,
	collision_box = pebble_box_2,
	node_box = pebble_box_2,
	sounds = default.node_sound_stone_defaults()
})

local pebble_box_3 = {
	type = "fixed",
	fixed = {
		{-0.3, -0.2, -0.3, 0.4, -0.1, 0.3},
		{-0.4, -0.3, -0.4, 0.5, -0.2, 0.4},
		{-0.5, -0.4, -0.5, 0.5, -0.3, 0.5},
		{-0.4, -0.5, -0.4, 0.4, -0.4, 0.4}
	}
}

minetest.register_node("cratermg:pebble_big", {
	description = "Pebble small",
	tiles = {"default_stone.png^[colorize:#F408"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {falling_node=1, dig_immediate=3 --not_in_creative_inventory=1
        },
	sunlight_propagates = true,
	selection_box = pebble_box_3,
	collision_box = pebble_box_3,
	node_box = pebble_box_3,
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("cratermg:clayblock", {
	description = "Clayblock",
	tiles = {"default_clay.png^[colorize:#863710aa"},
	groups = {crumbly = 3},
	sounds = default.node_sound_stone_defaults(),
	drops = "default:clay_lump"
})

-- Ore nodes registration
-------------------------

minetest.register_node("cratermg:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_stone.png^[colorize:#F408^default_mineral_coal.png"},
	groups = {cracky = 3},
	drop = "default:coal_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_stone.png^[colorize:#F408^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^[colorize:#F408^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:stone_with_tin", {
	description = "Tin Ore",
	tiles = {"default_stone.png^[colorize:#F408^default_mineral_tin.png"},
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:stone_with_mese", {
	description = "Mese Ore",
	tiles = {"default_stone.png^[colorize:#F408^default_mineral_mese.png"},
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"default_stone.png^[colorize:#F408^default_mineral_gold.png"},
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_stone.png^[colorize:#F408^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

-- Mineral nodes registration
-----------------------------

minetest.register_node("cratermg:sediment_with_iron", {
	description = "Iron Ore",
	tiles = {"default_cobble.png^[colorize:#F408^default_mineral_iron.png"},
	groups = {cracky = 2},
	drop = "default:iron_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:sediment_with_copper", {
	description = "Copper Ore",
	tiles = {"default_cobble.png^[colorize:#F408^default_mineral_copper.png"},
	groups = {cracky = 2},
	drop = "default:copper_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:sediment_with_tin", {
	description = "Tin Ore",
	tiles = {"default_cobble.png^[colorize:#F408^default_mineral_tin.png"},
	groups = {cracky = 2},
	drop = "default:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:sediment_with_mese", {
	description = "Mese Ore",
	tiles = {"default_cobble.png^[colorize:#F408^default_mineral_mese.png"},
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:sediment_with_gold", {
	description = "Gold Ore",
	tiles = {"default_cobble.png^[colorize:#F408^default_mineral_gold.png"},
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:sediment_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_cobble.png^[colorize:#F408^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})


-- Override config
------------------

cratermg.materials.vacuum      = minetest.get_content_id("air")
cratermg.materials.water       = minetest.get_content_id("default:water_source")
cratermg.materials.lava        = minetest.get_content_id("default:lava_source")
cratermg.materials.stone       = minetest.get_content_id("cratermg:stone")
cratermg.materials.hills       = minetest.get_content_id("cratermg:stone")
cratermg.materials.mare        = minetest.get_content_id("cratermg:stone")
cratermg.materials.crater_edge = minetest.get_content_id("cratermg:sediment")
cratermg.materials.crater_fill = minetest.get_content_id("cratermg:sediment")
cratermg.materials.dust1       = minetest.get_content_id("cratermg:dust1")
cratermg.materials.dust2       = minetest.get_content_id("cratermg:dust2")
cratermg.materials.dust_pebble = minetest.get_content_id("cratermg:dust_pebble")
cratermg.materials.dust_frozen = minetest.get_content_id("cratermg:dust_frozen")
cratermg.materials.ice         = minetest.get_content_id("cratermg:ice")
cratermg.materials.dry_ice     = minetest.get_content_id("cratermg:dry_ice")
cratermg.materials.pebble = {}
cratermg.materials.pebble[1] = minetest.get_content_id("cratermg:pebble")
cratermg.materials.pebble[2] = minetest.get_content_id("cratermg:pebble_small")
cratermg.materials.pebble[3] = minetest.get_content_id("cratermg:pebble_big")


-- Ores registration
--------------------

-- higher spread reduces number ov veins and increases width of veins a little bit
-- higher scale reduces width of veins
-- -> the more rare an or shall be, it should have more scale and more spread

cratermg.register_ore({
	--noise = {scale = 20, octaves = 3, persist = 1, offset = -1.3},
	noise = {scale = 20, octaves = 3, persist = 1, offset = 0, spread = {x=70, y=70, z=70}},
	ore = "cratermg:stone_with_mese", spawns_in = "cratermg:stone"
	--ore = "cratermg:stone_with_mese", spawns_in = "default:glass"
})

cratermg.register_ore({
	--noise = {scale = 20, octaves = 3, persist = 1, offset = -1.3},
	noise = {scale = 20, octaves = 3, persist = 1, offset = 0, spread = {x=70, y=70, z=70}},
	ore = "cratermg:stone_with_diamond", spawns_in = "cratermg:stone"
	--ore = "cratermg:stone_with_diamond", spawns_in = "default:glass"
})

cratermg.register_ore({
	--noise = {scale = 20, octaves = 1, persist = 1, offset = -0.3},
	noise = {scale = 5, octaves = 2, persist = 1, offset = 0, spread = {x=40, y=40, z=40}},
	ore = "cratermg:stone_with_iron", spawns_in = "cratermg:stone"
	--ore = "cratermg:stone_with_iron", spawns_in = "default:glass"
})

cratermg.register_ore({
	--noise = {scale = 20, octaves = 1, persist = 1, offset = -0.4},
	noise = {scale = 7, octaves = 2, persist = 1, offset = 0, spread = {x=50, y=50, z=50}},
	ore = "cratermg:stone_with_copper", spawns_in = "cratermg:stone"
	--ore = "cratermg:stone_with_copper", spawns_in = "default:glass"
})

cratermg.register_ore({
	--noise = {scale = 20, octaves = 1, persist = 1, offset = -0.4},
	noise = {scale = 5, octaves = 2, persist = 1, offset = 0, spread = {x=50, y=50, z=50}},
	ore = "cratermg:stone_with_gold", spawns_in = "cratermg:stone"
	--ore = "cratermg:stone_with_copper", spawns_in = "default:glass"
})

cratermg.register_ore({
	--noise = {scale = 20, octaves = 2, persist = 1, offset = -1},
	noise = {scale = 3, octaves = 2, persist = 1, offset = 0, spread = {x=20, y=20, z=20}},
	ore = "cratermg:stone_with_tin", spawns_in = "cratermg:stone"
	--ore = "cratermg:stone_with_tin", spawns_in = "default:glass"
})

cratermg.register_ore({
	--noise = {scale = 20, octaves = 2, persist = 1, offset = -1.5},
	noise = {scale = 3, octaves = 2, persist = 1, offset = 0, spread = {x=20, y=20, z=20}},
	ore = "cratermg:stone_with_coal", spawns_in = "cratermg:stone"
	--ore = "cratermg:stone_with_coal", spawns_in = "default:glass"
})


-- Debris registration
----------------------

cratermg.register_debris({
	name = minetest.get_name_from_content_id(cratermg.materials.crater_fill),
	chance = 5,
})

cratermg.register_debris({
	name = "cratermg:sediment_with_copper",
	chance = 1,
})

cratermg.register_debris({
	name = "cratermg:sediment_with_iron",
	chance = 5,
})

cratermg.register_debris({
	name = "cratermg:sediment_with_tin",
	chance = 1,
})

cratermg.register_debris({
	name = "cratermg:sediment_with_mese",
	chance = 1,
})

cratermg.register_debris({
	name = "cratermg:sediment_with_diamond",
	chance = 1,
})

cratermg.register_debris({
	name = "cratermg:sediment_with_gold",
	chance = 2,
})
