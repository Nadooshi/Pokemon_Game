/// @desc

// Inherit the parent event
event_inherited();

if parameter_name != "" {
	if sc_does_exist(map) {
		image_index = (map[? parameter_name]-1) * 0.1
		hint = "Action power " + string(ceil(image_index))
	}
}
