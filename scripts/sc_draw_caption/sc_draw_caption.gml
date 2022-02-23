function sc_draw_caption(caption, x_mod) {
if is_undefined(x_mod)	x_mod = 0
var _x = x - (sprite_width * 0.5) + x_mod
draw_set_color(0)
	draw_text_transformed(_x, y, caption, 0.2, 0.2, 0)
draw_set_color(c_white)
	draw_text_transformed(_x-2, y-2, caption, 0.2, 0.2, 0)
}


