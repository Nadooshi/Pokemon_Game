/// @desc

if view_current = 0 {
	draw_set_alpha(0.5)
	draw_set_color(0)
	draw_rectangle(0,0, room_width, room_height, false)
	draw_set_alpha(1)
	draw_set_color(c_white)
	view_visible[0] = false
	view_visible[1] = true
}
