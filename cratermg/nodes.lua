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
	groups = {cracky = 2},
	drop = "cratermg:sediment",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:sediment", {
	description = planet_name.." Sediments",
	tiles = {"default_cobble.png^[colorize:#F408"},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("cratermg:dust", {
	description = planet_name.." Dust",
	tiles = {"default_desert_sand.png^[colorize:#F408"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("cratermg:dust1", {
	description = planet_name.." Dust",
	tiles = {"default_desert_sand.png^[colorize:#F308"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("cratermg:dust2", {
	description = planet_name.." Dust",
	tiles = {"default_desert_sand.png^[colorize:#F208"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
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
--cratermg.materials.hills       = minetest.get_content_id("default:glass")
--cratermg.materials.mare        = minetest.get_content_id("default:glass")
cratermg.materials.hills       = minetest.get_content_id("cratermg:stone")
cratermg.materials.mare        = minetest.get_content_id("cratermg:stone")
cratermg.materials.crater_edge = minetest.get_content_id("cratermg:sediment")
cratermg.materials.crater_fill = minetest.get_content_id("cratermg:sediment")
cratermg.materials.dust        = minetest.get_content_id("cratermg:dust")
cratermg.materials.dust2       = minetest.get_content_id("cratermg:dust1")
cratermg.materials.dust3       = minetest.get_content_id("cratermg:dust2")
cratermg.materials.ice         = minetest.get_content_id("default:ice")

-- Ores registration
--------------------

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
