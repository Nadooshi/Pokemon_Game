/// @desc Draw like ob_ui_object

draw_self()

if show_hint
if hint != "" {
	draw_set_font(fn_card)
	draw_set_color(c_black)
	draw_text(mouse_x + 26, mouse_y - 46, hint)
	draw_set_color(c_white)
	draw_text(mouse_x + 24, mouse_y - 44, hint)
}
