/// @desc Update

// Inherit the parent event
event_inherited();

if sc_does_exist(parent) {
	if map[? "levelup"] {
		image_speed = 1
		skeleton_animation_set("Active")
		caption = map[? "level"] - 1
	} else {
		caption = map[? "level"]
	}
		
	_w = string_width(caption)
	_h = string_height(caption)
}
