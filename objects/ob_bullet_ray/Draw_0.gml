/// @desc 
if not init
	exit
	
if not sprite_exists(sprite_index)
	exit
	
// mid_value (from composed) is image_yscale here
for (var i=0; i < count; i++) 
	draw_sprite_ext(sprite_index, image_index, x1 + _x*i, y1 + _y*i, 1, mid_value, image_angle, image_blend, 1);

