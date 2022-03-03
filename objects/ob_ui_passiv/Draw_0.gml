/// @desc

// Inherit the parent event
event_inherited();

var _x = sprite_height * 0.5
if parameter_name = "passiv_1"
	sc_draw_caption(animation[? "name"][? "first"], _x)
if parameter_name = "passiv_2"
	sc_draw_caption(animation[? "name"][? "second"], _x)

