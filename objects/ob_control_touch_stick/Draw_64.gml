/// @desc

draw_set_color(c_white)
var _sz2 = display_get_gui_height()*0.025
draw_set_alpha(0.25)
draw_circle(X, Y, radius, false)
draw_set_alpha(0.5)

draw_circle(
	X + lengthdir_x(radius-_sz2, direction),
	Y + lengthdir_y(radius-_sz2, direction),
	_sz2, false
)

draw_set_alpha(1)
