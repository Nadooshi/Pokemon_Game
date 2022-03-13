function sc_draw_caption(caption, scale, x_mod, y_mod) {
if is_undefined(x_mod)	x_mod = 0
if is_undefined(y_mod)	y_mod = 0
if is_undefined(scale)	scale = 0.2
var _x = x - (sprite_width * 0.5) + x_mod
var _y = y + y_mod
draw_set_color(0)
	draw_text_transformed(_x, _y, caption, scale, scale, 0)
draw_set_color(c_white)
	draw_text_transformed(_x-2, _y-2, caption, scale, scale, 0)
}


