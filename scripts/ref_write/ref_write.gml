/// @desc Set map field value by reference
/// @arg ref
/// @arg value
function ref_write(argument0, argument1) {

	var _ref = argument0
	var _val = argument1

	if not is_undefined(_ref)
	if is_array(_ref)
		ds_map_set(_ref[0], _ref[1], _val)



}
