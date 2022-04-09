
minetest.register_craft({
	output = "default:sand",
	recipe = {
		{"group:sand"},
	}
})

minetest.register_craft({
	output = "default:gravel",
	recipe = {
		{"cratermg:dust_pebble"},
	}
})

minetest.register_craft({
	output = "marssurvive:pointed_pebble",
	recipe = {
		{"cratermg:pebble"},
	}
})
minetest.register_craft({
	output = "marssurvive:pointed_pebble",
	recipe = {
		{"cratermg:pebble_small"},
	}
})
minetest.register_craft({
	output = "marssurvive:pointed_pebble",
	recipe = {
		{"cratermg:pebble_big"},
	}
})

minetest.register_craft({
	output = "marssurvive:trapdoor_1 2",
	recipe = {
		{"marssurvive:warning","marssurvive:shieldblock",""},
		{"marssurvive:warning","marssurvive:shieldblock", ""},
	}
})

minetest.register_craft({
	output = "marssurvive:smart_glasspane_side 2",
	recipe = {{"default:glass", "default:glass"},
		{"default:glass", "default:glass"},}})
minetest.register_craft({
	output = "marssurvive:smart_glasspane_down",
	recipe = {{"marssurvive:smart_glasspane_side"},}})
minetest.register_craft({
	output = "marssurvive:smart_glasspane_up",
	recipe = {{"marssurvive:smart_glasspane_down"},}})
minetest.register_craft({
	output = "marssurvive:smart_glasspane_side",
	recipe = {{"marssurvive:smart_glasspane_up"},}})

minetest.register_craft({
	output = "marssurvive:clight 3",
	recipe = {{"default:glass","default:glass","default:glass"},
		{"","default:mese_crystal_fragment",""}}})


minetest.register_craft({
	output = "marssurvive:diglazer",
	recipe = {
		{"spacesuit:air_gassbottle","marssurvive:shieldblock","marssurvive:shieldblock"},
		{"","marssurvive:shieldblock","marssurvive:shieldblock"},
	}
})

minetest.register_craft({
	output = "marssurvive:door2_1 2",
	recipe = {
		{"marssurvive:warning","marssurvive:shieldblock",""},
		{"marssurvive:warning","marssurvive:shieldblock", ""},
		{"marssurvive:warning","marssurvive:shieldblock", ""},
	}
})

minetest.register_craft({
	output = "marssurvive:warning 4",
	recipe = {
		{"default:coal_lump","cratermg:dust1",""},
		{"cratermg:dust1","default:coal_lump", ""},
	}
})

minetest.register_craft({
	output = "marssurvive:steelwallblock 8",
	recipe = {
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"default:steel_ingot","", "default:steel_ingot"},
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "marssurvive:shieldblock 4",
	recipe = {
		{"default:steel_ingot","default:steel_ingot",""},
		{"default:steel_ingot","default:steel_ingot", ""},
	}
})

minetest.register_craft({
	output = "default:stone",
	recipe = {
		{"cratermg:stone"},
	}
})

minetest.register_craft({
	output = "default:cobble_stone",
	recipe = {
		{"cratermg:sediments"},
	}
})

minetest.register_craft({
	output = "default:stick 4",
	recipe = {{"marssurvive:clayblock","",""}}})

minetest.register_craft({
	output = "marssurvive:wood 3",
	recipe = {{"marssurvive:tree","",""}}})


minetest.register_craft({
	output = 'default:sapling',
	recipe = {
		{'', 'default:apple', ''},
		{'', 'default:dirt', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "default:water_source",
	recipe = "cratermg:ice",
})

minetest.register_craft({
	type = "cooking",
	output = "default:water_source",
	recipe = "default:ice",
})

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "marssurvive:smart_glasspane_side",
})

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "group:mars_sand",
})

minetest.register_craftitem("marssurvive:minerals", {
	description = "Minerals",
	inventory_image = "marssurvive_minerals.png"
})

minetest.register_craft({
	output = "default:dirt",
	recipe = {
		{"marssurvive:minerals","cratermg:dust1"}
	}
})

minetest.register_craft({
	output = "default:dirt",
	recipe = {
		{"marssurvive:minerals","cratermg:dust2"}
	}
})

minetest.override_item("cratermg:pebble", {
    drop = {
        max_items = 1,
        items = {
            {
                rarity = 10,
                items = {"marssurvive:minerals"},
            },
            {
                rarity = 2,
                items = {"marssurvive:pointed_pebble"},
            },
            {
                rarity = 1,
                items = {"cratermg:pebble"},
            }
        },
    },
})

minetest.override_item("cratermg:pebble_small", {
    drop = {
        max_items = 1,
        items = {
            {
                rarity = 10,
                items = {"marssurvive:minerals"},
            },
            {
                rarity = 2,
                items = {"marssurvive:pointed_pebble"},
            },
            {
                rarity = 1,
                items = {"cratermg:pebble_small"},
            }
        },
    },
})

minetest.override_item("cratermg:pebble_big", {
    drop = {
        max_items = 1,
        items = {
            {
                rarity = 10,
                items = {"marssurvive:minerals"},
            },
            {
                rarity = 2,
                items = {"marssurvive:pointed_pebble"},
            },
            {
                rarity = 1,
                items = {"cratermg:pebble_big"},
            }
        },
    },
})
