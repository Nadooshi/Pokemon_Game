/// @desc Update

// Inherit the parent event
event_inherited();

if sc_does_exist(parent) {
	caption = ds_map_find_value(map, "level")
	_w = string_width(caption)
	_h = string_height(caption)
}
