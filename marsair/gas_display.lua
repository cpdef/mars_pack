
for i = 0,8 do
    --local hidden = (i ~= 0)
    minetest.register_node("marsair:oxygen_display_".. tostring(i), {
        description = "Oxygen concentration display",
            tiles = {
                "marssurvive_shieldblock.png",
                "marssurvive_shieldblock.png",
                "marssurvive_shieldblock.png",
                "marssurvive_shieldblock.png",
                "marssurvive_shieldblock.png",
                "mars_gasdisplay_".. tostring(i) ..".png",
            },
        paramtype2 = "facedir",
        groups = {cracky = 2, marsair_oxygen_display = 1, display_index = i, not_in_creative_inventory = hidden},
        sounds = default.node_sound_wood_defaults(),
    })
end

minetest.register_abm{
    label = "update display",
    nodenames = {"group:marsair_oxygen_display"},
    interval = 5,
    chance = 1,
    action = function(pos)
        local node = minetest.get_node(pos)
        local dir = minetest.facedir_to_dir(node.param2)
        local measure_pos = {x=pos.x-dir.x, y=pos.y, z=pos.z-dir.z}
        local concentration = gas.get_concentration(measure_pos)
        if minetest.get_node(measure_pos).name ~= "gas:oxygen" then
            concentration = 0
        end

        local display_index = math.floor((concentration+1)/2)
        local old_display_index = minetest.registered_nodes[node.name].groups.display_index
        if display_index ~= old_display_index then
            minetest.swap_node(pos, {
                name="marsair:oxygen_display_".. tostring(display_index),
                param2 = node.param2
            })
        end
    end
}
