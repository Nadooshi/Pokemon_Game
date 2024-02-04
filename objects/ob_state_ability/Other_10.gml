/// @desc 

// Inherit the parent event
event_inherited();

if parameter_name != "" {
	if sc_does_exist(map, undefined, "'map' in User0") {
		var _abil = map[? "active"]
		if sc_does_exist(_abil, undefined, "'_abil' in User0") {
			image_index = _abil[? parameter_name]
			hint = _abil[? "name"]
		} else {
			image_index = 0
		}
	}
}

