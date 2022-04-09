minetest.register_craftitem("marsair:rotor", {
	description = "Rotor 4",
	inventory_image = "marsair_rotor.png"
})

minetest.register_craft({
	output = "marsair:rotor",
	recipe = {
		{"default:steel_ingot","","default:steel_ingot"},
		{"","default:steel_ingot",""},
		{"", "default:steel_ingot",""},
	}
})

minetest.register_craft({
	output = "marsair:airgen",
	recipe = {
		{"default:steel_ingot","marsair:rotor","default:steel_ingot"},
		{"marsair:rotor","", "marsair:rotor"},
		{"default:steel_ingot","marsair:rotor","default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "marsair:airmaker",
	recipe = {
		{"default:steel_ingot","marsair:rotor","default:steel_ingot"},
		{"default:steel_ingot","default:dirt", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "marsair:air_deflater",
	recipe = {
		{"default:steel_ingot","marsair:rotor","default:steel_ingot"},
		{"default:steel_ingot","marsair:rotor", "default:steel_ingot"},
	}
})
