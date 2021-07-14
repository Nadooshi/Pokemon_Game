/// @desc 

//if sprite_exists(sprite_index)
//	draw_self()

//draw_ellipse(x - radius, y - radius,  x + radius, y + radius, true)

for (var i=0; i<ds_list_size(drops); i++) 
	draw_sprite_ext(sprite_index, drops[| i].frame, drops[| i].x, drops[| i].y, 1, 1, 0, image_blend, 1)

