/// @desc

event_inherited()

if is_undefined(caption) exit
if caption = "" exit

draw_set_font(fn_card)


_w = string_width(caption)
_h = string_height(caption)
draw_set_color(c_black)
draw_text(x + (sprite_width-_w) div 2 - 2, y + (sprite_height-_h) div 2 + 2, caption)
//draw_set_color(c_white)
draw_set_color(image_blend)
draw_text(x + (sprite_width-_w) div 2, y + (sprite_height-_h) div 2, caption)
