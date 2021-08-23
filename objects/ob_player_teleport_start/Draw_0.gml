/// @desc

if sprite_exists(spr_drawn[0]) {
	draw_sprite(sp_shadowworld, pokemon_id.size, x, y + 12)
	draw_sprite_ext(sprite_id, pokemon_id.image_index, x, y, pokemon_id.image_xscale, pokemon_id.image_yscale, 0, c_white, 1)
	gpu_set_blendmode(bm_add)
	for (var i=-1; i<=1; i++)
	for (var j=-1; j<=1; j++)
		draw_sprite_ext(sprite_id, pokemon_id.image_index, x-i*2, y-j*2, pokemon_id.image_xscale, pokemon_id.image_yscale, 0, c_white, flash_alpha)
	gpu_set_blendmode(bm_normal)
}

if sprite_exists(spr_drawn[1]) {
	draw_set_alpha(0.5)
	draw_sprite(sp_shadowworld, pokemon_id.size, x, y + 12)
	draw_set_alpha(1)
	draw_self()
}

