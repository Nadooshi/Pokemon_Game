/// @desc
event_inherited()

draw_sprite(sp_shadowworld, size, x, y + 12)

draw_self()

if hurt_timeout > 0 {
	var _col = c_white
	if (counter div 3) mod 2
		_col = c_fuchsia
	else
		_col = c_aqua
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index, image_index, x+random(2.2)-1.1, y+random(2.2)-1.1, image_xscale*1.1, image_yscale*1.1, image_angle, _col, 1)
	gpu_set_blendmode(bm_normal)
}


