/// @arg id
/// @arg source
function sc_copy_action(argument0, argument1) {

	ds_map_copy(argument0, argument1);
	if not sc_does_exist(argument1[? "active"], , undefined, "'arg1[? active]' in sc_copy_action")
		argument1[? "active"] = ds_map_create()
	ds_map_copy(argument0[? "active"], argument1[? "active"]);



}
