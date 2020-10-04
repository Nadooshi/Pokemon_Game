	/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if not is_undefined(map)
if ds_exists(map, ds_type_map) {
	if sc_does_exist(map[? "active"])
		ds_map_destroy(map[? "active"])
	
	ds_map_destroy(map)
}
