GRAINS_LIST={
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
--[[
LEGUMES_LIST={
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

NUTS_LIST={
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

for i=1, #GRAINS_LIST do

	for j=1, 8 do
	minetest.register_node("farming:"..GRAINS_LIST[i].."_stage_"..j, {
		description = GRAINS_LIST[i],
		tiles = {"farming_"..GRAINS_LIST[i].."_"..j..".png"},
		groups = {oddly_breakable_by_hand=2, cracky=3, dig_immediate=1},
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
	
	minetest.register_craftitem("farming:"..GRAINS_LIST[i].."_seeds", {
		description = GRAINS_LIST[i].." seeds",
		inventory_image = "farming_"..GRAINS_LIST[i].."_seeds.png",
	})
	
	minetest.register_craftitem("farming:"..GRAINS_LIST[i].."_sheaf", {
		description = GRAINS_LIST[i].." sheaf",
		inventory_image = "farming_"..GRAINS_LIST[i].."_sheaf.png",
	})
end