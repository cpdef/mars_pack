-- adding spacesuit to new players
minetest.register_on_newplayer(function(player)
	local inv=player:get_inventory()
	inv:add_item("main","spacesuit:air_gasbottle")
	inv:add_item("main","marsair:airgen")
	inv:add_item("main","flowers:geranium 3")
	inv:add_item("main","marssurvive:random_seed 20")
	inv:add_item("main","default:apple 20")
	inv:add_item("main","gas:oxygen 416")

	-- enforce spacesuit stack one:
	local stack_one = inv:get_stack("main", 1)
	if stack_one:get_name() ~= "spacesuit:sp" then
		inv:set_stack("main", 1, {name="spacesuit:sp", count=1, wear=0, metadata=""})
		inv:add_item("main", stack_one:get_name().." "..stack_one:get_count())
	end
end)
print("[MOD] mars-pack_initial_items loaded!")
