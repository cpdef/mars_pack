

minetest.register_abm({
	nodenames = {"default:water_source"},
	neighbors = {"cratermg:ice"},
	interval = 10,
	chance = 3,
	action = function(pos)
		minetest.set_node(pos, {name = "marssurvive:ice"})
	end,
})
