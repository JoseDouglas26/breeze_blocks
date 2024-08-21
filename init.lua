local S = minetest.get_translator("breeze_blocks")
local models = { "rods", "eye", "rhomb", "cross" }

local function make_desc(name)
	return name:sub(1,1):upper()..name:sub(2)
end

local function make_invimg(texture, model)
    return texture.."^breeze_blocks_mask_"..model..".png^[makealpha:250,130,50"
end

for _, model in pairs(models) do
    for color, defs in pairs(mcl_dyes.colors) do
        local texture = "mcl_colorblocks_concrete_"..color..".png"

        minetest.register_node("breeze_blocks:"..model.."_"..color, {
            description = S("@1 @2 Breeze Block", defs.readable_name, make_desc(model)),
            groups = { pickaxey = 1 },
            collision_box = { type = "fixed", fixed = { -0.5, -0.5, -0.125, 0.5, 0.5, 0.125 } },
            selection_box = { type = "fixed", fixed = { -0.5, -0.5, -0.125, 0.5, 0.5, 0.125 } },
            sunlight_propagates = true,
            inventory_image = make_invimg(texture, model),
            tiles = { texture },
            paramtype = "light",
            paramtype2 = "facedir",
            drawtype = "mesh",
            mesh = "breeze_blocks_"..model..".obj",
            on_place = minetest.rotate_node,
            sounds = mcl_sounds.node_sound_stone_defaults(),
            _mcl_blast_resistance = 1.8,
            _mcl_hardness = 1.8,
            _mcl_stonecutter_recipes = { "mcl_colorblocks:concrete_"..color }
        })
    end
end
