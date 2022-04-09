local S = default.get_translator

--
-- Picks
--

minetest.register_tool("steel_tools:pick_stone", {
	description = S("Stone Pickaxe"),
	inventory_image = "steel_tool_stonepick.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_tool("steel_tools:pick_bronze", {
	description = S("Bronze Pickaxe"),
	inventory_image = "steel_tool_bronzepick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.50, [2]=1.80, [3]=0.90}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_tool("steel_tools:pick_steel", {
	description = S("Steel Pickaxe"),
	inventory_image = "steel_tool_steelpick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_tool("steel_tools:pick_mese", {
	description = S("Mese Pickaxe"),
	inventory_image = "steel_tool_mesepick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_tool("steel_tools:pick_diamond", {
	description = S("Diamond Pickaxe"),
	inventory_image = "steel_tool_diamondpick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

--
-- Shovels
--

minetest.register_tool("steel_tools:shovel_stone", {
	description = S("Stone Shovel"),
	inventory_image = "steel_tool_stoneshovel.png",
	wield_image = "steel_tool_stoneshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

minetest.register_tool("steel_tools:shovel_bronze", {
	description = S("Bronze Shovel"),
	inventory_image = "steel_tool_bronzeshovel.png",
	wield_image = "steel_tool_bronzeshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.65, [2]=1.05, [3]=0.45}, uses=35, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

minetest.register_tool("steel_tools:shovel_steel", {
	description = S("Steel Shovel"),
	inventory_image = "steel_tool_steelshovel.png",
	wield_image = "steel_tool_steelshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

minetest.register_tool("steel_tools:shovel_mese", {
	description = S("Mese Shovel"),
	inventory_image = "steel_tool_meseshovel.png",
	wield_image = "steel_tool_meseshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

minetest.register_tool("steel_tools:shovel_diamond", {
	description = S("Diamond Shovel"),
	inventory_image = "steel_tool_diamondshovel.png",
	wield_image = "steel_tool_diamondshovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

--
-- Axes
--

minetest.register_tool("steel_tools:axe_stone", {
	description = S("Stone Axe"),
	inventory_image = "steel_tool_stoneaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

minetest.register_tool("steel_tools:axe_bronze", {
	description = S("Bronze Axe"),
	inventory_image = "steel_tool_bronzeaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.75, [2]=1.70, [3]=1.15}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

minetest.register_tool("steel_tools:axe_steel", {
	description = S("Steel Axe"),
	inventory_image = "steel_tool_steelaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

minetest.register_tool("steel_tools:axe_mese", {
	description = S("Mese Axe"),
	inventory_image = "steel_tool_meseaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

minetest.register_tool("steel_tools:axe_diamond", {
	description = S("Diamond Axe"),
	inventory_image = "steel_tool_diamondaxe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

--
-- Swords
--

minetest.register_tool("steel_tools:sword_stone", {
	description = S("Stone Sword"),
	inventory_image = "steel_tool_stonesword.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

minetest.register_tool("steel_tools:sword_bronze", {
	description = S("Bronze Sword"),
	inventory_image = "steel_tool_bronzesword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.75, [2]=1.30, [3]=0.375}, uses=35, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

minetest.register_tool("steel_tools:sword_steel", {
	description = S("Steel Sword"),
	inventory_image = "steel_tool_steelsword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

minetest.register_tool("steel_tools:sword_mese", {
	description = S("Mese Sword"),
	inventory_image = "steel_tool_mesesword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

minetest.register_tool("steel_tools:sword_diamond", {
	description = S("Diamond Sword"),
	inventory_image = "steel_tool_diamondsword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

--
-- Register Craft Recipies
--

if minetest.get_modpath("basic_materials") ~= nil then
	minetest.register_alias("steel_tools:steel_bar", "basic_materials:steel_bar")
else
	minetest.register_craftitem("steel_tools:steel_bar", {
		description = "Steel Bar",
		inventory_image = "steel_tools_bar.png",
	})
	
	minetest.register_craft( {
		output = "steel_tools:steel_bar 6",
		recipe = {
			{"", "", "default:steel_ingot"},
			{"", "default:steel_ingot", ""},
			{"default:steel_ingot", "", ""},
		},
	})
end

local S = farming.get_translator

farming.register_hoe(":farming:steel_hoe_stone", {
	description = S("Stone Hoe with steel handle"),
	inventory_image = "steel_tool_stonehoe.png",
	max_uses = 140,
	recipe = {
		{"group:stone", "group:stone"},
		{"","steel_tools:steel_bar"},
		{"","steel_tools:steel_bar"}
	},
	groups = {hoe = 1}
})

farming.register_hoe(":farming:steel_hoe_steel", {
	description = S("Steel Hoe with steel handle"),
	inventory_image = "steel_tool_steelhoe.png",
	max_uses = 550,
	recipe = {
		{"default:steel_ingot", "default:steel_ingot"},
		{"","steel_tools:steel_bar"},
		{"","steel_tools:steel_bar"}
	},
	groups = {hoe = 1}
})


local craft_ingreds = {
	stone = "group:stone",
	steel = "default:steel_ingot",
	bronze = "default:bronze_ingot",
	mese = "default:mese_crystal",
	diamond = "default:diamond"
}

for name, mat in pairs(craft_ingreds) do
	minetest.register_craft({
		output = "steel_tools:pick_".. name,
		recipe = {
			{mat, mat, mat},
			{"", "steel_tools:steel_bar", ""},
			{"", "steel_tools:steel_bar", ""}
		}
	})

	minetest.register_craft({
		output = "steel_tools:shovel_".. name,
		recipe = {
			{mat},
			{"steel_tools:steel_bar"},
			{"steel_tools:steel_bar"}
		}
	})

	minetest.register_craft({
		output = "steel_tools:axe_".. name,
		recipe = {
			{mat, mat},
			{mat, "steel_tools:steel_bar"},
			{"", "steel_tools:steel_bar"}
		}
	})

	minetest.register_craft({
		output = "steel_tools:sword_".. name,
		recipe = {
			{mat},
			{mat},
			{"steel_tools:steel_bar"}
		}
	})
end

