/// @desc 

var max_x = room_width
var _max
for (var i=0; i<8; i++)
if view_visible[i] {
	_max_x = camera_get_view_x(view_camera[i]) + camera_get_view_width(view_camera[i])
	if max_x < _max_x then max_x = _max_x
}
var text_x = clamp(mouse_x, 0, max_x - string_width(hint))

if show_hint
if hint != "" {
	draw_set_font(fn_card)
	draw_set_color(c_black)
	draw_text(text_x, mouse_y - 54, hint)
	draw_set_color(c_white)
	draw_text(text_x, mouse_y - 56, hint)
}
