/// @desc

with path_target {
	draw_set_color(c_red)
	draw_set_alpha(0.5)
//	draw_path(path, 0, 0, true)
	for (var i=0; i<path_get_number(path); i++)
		draw_circle(path_get_point_x(path, i), path_get_point_y(path, i), 2, false)
	
	draw_set_color(c_white)
	draw_set_alpha(0.5)
	
	draw_circle(x, y, 4, false)
	draw_set_alpha(1)
}

