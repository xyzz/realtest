farming = {}
farming.grains={
	"wheat_hard",
	"wheat_soft",--[[
	"rye",
	"rice",
	"oast",
	"barley",
	"maize",
	"millet",
	"siberian_millet",
	"panic",
	"payza",
	"dagussa",
	"buckwheat",
	"teff",
	"rape",]]
}
farming.grains_desc={
	"Hard Wheat",
	"Soft Wheat",
	"Rye",
	"Rice",
	"Oast",
	"Barley",
	"Maize",
	"Millet",
	"Siberian Millet",
	"Panic",
	"Payza",
	"Dagussa",
	"Buckwheat",
	"Teff",
	"Rape",
}
--[[
farming.legumes={
	"peas",
	"beans",
	"soy_beans",
	"vetch",
	"lentils",
	"beans",
	"peanuts",
	"lupins",
	"chick",
	"bamboo",
	"sugar_cane",
}

farming.nuts={
	"walnuts",
	"black_walnut",
	"manchurian",
	"pecan",
	"filberts",
	"hazelnuts",
	"chestnuts",
	"acorns",
	"beech",
	"almonds",
	"pistachios",
	"cashew_nuts",
	"cedar",
	"coconut",
}]]

for i, grain in ipairs(farming.grains) do
	for j = 1,8 do
		local drop
		if j == 8 then
			drop = "farming:"..grain.."_sheaf"
		else
			drop = {
				max_items = 1,
				items = {
					{
						items = {},
						rarity = 2,
					},
					{
						items = {"farming:"..grain.."_seeds"},
					}
				}
			}
		end
		minetest.register_node("farming:"..grain.."_stage_"..j, {
			description = farming.grains_desc[i],
			tiles = {"farming_"..grain.."_"..j..".png"},
			groups = {cracky=3, dig_immediate=2},
			drop = drop,
			sounds = default.node_sound_leaves_defaults(),
			walkable = false,
			drawtype = "nodebox",
			paramtype = "light",
			node_box = {
				type = "fixed",
				fixed = {
					{-0.5,-0.5,-0.3,0.5,0.5,-0.3},
					{-0.5,-0.5, 0.3,0.5,0.5, 0.3},
					{-0.3,-0.5,-0.5,-0.3,0.5,0.5},
					{ 0.3,-0.5,-0.5, 0.3,0.5,0.5},
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {
					{-0.5,-0.5,-0.5,0.5,-0.5+j/10,0.5},
				},
			},
			on_construct = function(pos)
				local meta = minetest.env:get_meta(pos)
				meta:set_int("progress",j*10)
			end,
		})
	end
	
	minetest.register_craftitem("farming:"..grain.."_seeds", {
		description = farming.grains_desc[i].." Seeds",
		inventory_image = "farming_"..grain.."_seeds.png",
	})
	
	minetest.register_craftitem("farming:"..grain.."_sheaf", {
		description = farming.grains_desc[i].." Sheaf",
		inventory_image = "farming_"..grain.."_sheaf.png",
	})
end
