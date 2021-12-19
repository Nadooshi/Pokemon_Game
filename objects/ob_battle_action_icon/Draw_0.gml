/// @desc 


draw_self()
if on_lock
	draw_sprite_ext(sp_act_locked, 0, x, y, image_xscale, image_yscale, 0, c_white, 1)
else
	if not power_ready
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_navy, 0.7)

if warm_coeff > 0 
	draw_sprite_ext(
	  sprite_index, image_index, x, y,
	  image_xscale, image_yscale * warm_coeff, 0, 0, warm_coeff*0.5+0.2
	);
