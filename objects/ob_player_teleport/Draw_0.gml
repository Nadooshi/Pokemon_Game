/// @desc

image_blend = colors[(counter div 3) mod 2]
image_alpha = random(0.5) + 0.5

draw_set_alpha(0.5)
draw_sprite(sp_shadowworld, pokemon_id.size, x, y + _z + 12)
draw_set_alpha(1)

gpu_set_blendmode(bm_add)
draw_self()
gpu_set_blendmode(bm_normal)


