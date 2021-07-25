/// @desc 

//if sprite_exists(sprite_index)
//	draw_self()

for (var i=0; i<ds_list_size(drops); i++) 
	draw_sprite_ext(sprite_index, drops[| i].frame, drops[| i].x, drops[| i].y, 1, 1, 0, image_blend, 1)


