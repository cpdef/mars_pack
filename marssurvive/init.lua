marssurvive={player_space={},
itemdroptime=tonumber(minetest.settings:get("item_entity_ttl")),
gravity=0.6} --0.6 times the normal  gravity (1) should make a 3 block high jump ... more would be bad

if marssurvive.itemdroptime=="" or marssurvive.itemdroptime==nil then
	marssurvive.itemdroptime=880
else
	marssurvive.itemdroptime=hook_tmp_time-20
end

dofile(minetest.get_modpath("marssurvive") .. "/nodes.lua")
dofile(minetest.get_modpath("marssurvive") .. "/furnace.lua")
dofile(minetest.get_modpath("marssurvive") .. "/functions.lua")
dofile(minetest.get_modpath("marssurvive") .. "/tree.lua")
dofile(minetest.get_modpath("marssurvive") .. "/random_seed.lua")
dofile(minetest.get_modpath("marssurvive") .. "/tools.lua")
dofile(minetest.get_modpath("marssurvive") .. "/bags.lua")
dofile(minetest.get_modpath("marssurvive") .. "/craft.lua")

function marssurvive_setgrav(player,grav)
	player:set_physics_override({gravity=grav})
end

-- seting up settings for joined players
minetest.register_on_joinplayer(function(player)
		--player:override_day_night_ratio(12000)
		marssurvive.player_space[player:get_player_name()]={inside=""}
		marssurvive_space(player)
		player:hud_add({
			hud_elem_type = "image",
			text ="marssurvive_scene.png",
			name = "mars_sky",
			scale = {x=-100, y=-100},
			position = {x=0, y=0},
			alignment = {x=1, y=1},
		})
end)

function marssurvive_space(player)
	local pos=player:get_pos().y
	if marssurvive.player_space[player:get_player_name()].inside~="cave" and pos<=-100 then
		marssurvive.player_space[player:get_player_name()].inside="cave"
		marssurvive_setgrav(player,marssurvive.gravity)
		minetest.after(0.1,function()
			player:set_sky({
				type="plain",
				basecolor= "#000000",
				clouds=false
			})
		end)
	elseif marssurvive.player_space[player:get_player_name()].inside~="mars" and (pos>-100) and (pos<=1000) then
		marssurvive.player_space[player:get_player_name()].inside="mars"
		marssurvive_setgrav(player,marssurvive.gravity)
		minetest.after(0.1,function()
			player:set_sky({
				type="regular",
				basecolor= "#dba875",
				clouds=false,
				sky_color= {
					day_sky="#dba875",
					day_horizon="#dba875",
					dawn_sky="#bb7799",
					dawn_horizon="#bb7799",
					fog_sun_tint="#4444aa"
				}
			})
			player:set_sun({
				visible = true,
				--tonemap = "sun_tonemap_mars.png",
				sunrise = "sunrisebg_mars.png"
			})
			player:set_moon({
				visible = true,
				scale = 0.5
			})
		end)
	elseif marssurvive.player_space[player:get_player_name()].inside~="space" and pos>1000 then
		marssurvive.player_space[player:get_player_name()].inside="space"
		marssurvive_setgrav(player,0.05)
		minetest.after(0.1,function()
			player:set_sky({
				type = "skybox",
				basecolor = "#000000",
				clouds = false,
				textures = {
					"marssurvive_space_sky.png",
					"marssurvive_space_sky.png^marssurvive_mars.png",
					"marssurvive_space_sky.png",
					"marssurvive_space_sky.png",
					"marssurvive_space_sky.png",
					"marssurvive_space_sky.png"
				}
			})
		end)
	end
end

local timer = 0
minetest.register_globalstep(function(dtime)
	timer=timer+dtime
	if timer<5 then return end
	timer=0
	for i, player in pairs(minetest.get_connected_players()) do
		marssurvive_space(player)
	end
end)

--for doors and tools to remove whole door / to replace pos with air if enabled (overridden by marsair-mod)
marssurvive.replacenode = function(pos)
	minetest.set_node(pos, {name = "air"})
end

-- stack max is 16*(8+9+9), that is the highest concentration possible (16)
-- times the count of nodes around one node.
-- That way a air generator can use one stack, to fill all nodes around
gas.register_gas("oxygen", {
	tiles = {"gas.png"},
	inventory_image = "marssurvive_oxygen_inv.png",
	groups={breathable_gas = 1},
	stack_max = 416
}, 2)

spacesuit.register_spacesuit("", "spacesuit_sp_white_inv.png", 0, {"spacesuit_sp_white.png"})
spacesuit.register_spacesuit("black", "spacesuit_sp_black_inv.png", 66, {"spacesuit_sp_black.png"})

minetest.register_craft({
	output = "spacesuit:spblack",
	recipe = {
		{"","spacesuit:sp","",},
		{"", "marssurvive:shieldblock", "",},
		{"", "marssurvive:shieldblock", ""},

	},
})

print("[MOD] Marssurvive loaded! (default marssurvive)")
