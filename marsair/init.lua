marsair = {}

modfolder = minetest.get_modpath(minetest.get_current_modname())
-- CONFIG:
-- marsairconfig:
marsairconfig = {}
dofile(modfolder.."/config.lua")

-- flowers-config
dofile(modfolder.."/flower_conf.lua")

marsair.is_airflower = function(pos)
	local nodename = minetest.get_node(pos).name
        if (minetest.get_item_group(nodename, "flora")) > 0 then
            return true
        end
        if (minetest.get_item_group(nodename, "plant")) > 0 then
            return true
        end
        if (minetest.get_item_group(nodename, "seed")) > 0 then
            return true
        end
	return false
end

-- PIPEWORKS
if minetest.get_modpath("pipeworks") then
	marsair.pipeworks = true
	marsair.after_place = pipeworks.after_place
	marsair.after_dig = pipeworks.after_dig
end

-- generate air by trees
dofile(modfolder.."/plant_air.lua")

-- AIRMAKER+AIRCLEANER
dofile(modfolder.."/maker.lua")

-- AIRGEN
dofile(modfolder.."/airgen.lua")

-- gas_display
dofile(modfolder.."/gas_display.lua")

--remove air-item dropped by pipeworks:
if marsair.pipeworks then
	dofile(modfolder.."/air_item_disappear.lua")
end

--crafting recipes
dofile(modfolder.."/craft.lua")

print("[MOD] Marsair loaded!")
