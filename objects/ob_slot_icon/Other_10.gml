/// @desc

// Inherit the parent event
event_inherited();

if sc_does_exist(map) {
	image_index = map[? "face"] + 0.01
	hint = map[? "title"]
	visible = true
}
