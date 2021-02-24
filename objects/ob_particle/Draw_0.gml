/// @desc

// Inherit the parent event
event_inherited();

if sprite_exists(sprite_index) {
	draw_self()
	exit
}

draw_set_color(c_purple)
draw_set_alpha(image_alpha)
draw_circle(x,y, radius, false)
draw_set_color(c_black)
draw_circle(x,y, radius, true)
draw_set_color(c_white)
draw_set_alpha(1)
