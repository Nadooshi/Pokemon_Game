/// @desc 

if show_hint
if hint != "" {
	draw_set_font(fn_card)
	draw_set_color(c_black)
	draw_text(mouse_x, mouse_y - 54, hint)
	draw_set_color(c_white)
	draw_text(mouse_x, mouse_y - 56, hint)
}
