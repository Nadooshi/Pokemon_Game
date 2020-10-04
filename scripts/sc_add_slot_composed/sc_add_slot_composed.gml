/// @arg x
/// @arg y
/// @arg name
/// @arg arr_elements
/// @arg frame_object
function sc_add_slot_composed(_x, _y, _name, _arr, _frame_object) {

	if is_undefined(_frame_object)
		_frame_object = ds_map_find_value(_arr[0], "ob")
	
	var _arr_count = array_length_1d(_arr)
	var _parent_frame
	var _layer_name = _arr[0][? "layer"]
	with instance_create_layer(_x, _y, _layer_name , _frame_object) {
		image_xscale = ds_map_find_value(_arr[0], "xs")
		image_yscale = ds_map_find_value(_arr[0], "ys")
		name = _name
		_parent_frame = id
	}
	for (var i=1; i<_arr_count; i++)
	with instance_create_layer(_x, _y, ds_map_find_value(_arr[i], "layer"), ds_map_find_value(_arr[i], "ob")) {
		parent = _parent_frame
		parent.ui_objects[parent.ui_objects_count] = id
		parent.ui_objects_count++
		x = parent.x + ds_map_find_value(_arr[i], "x")
		y = parent.y + ds_map_find_value(_arr[i], "y")
		image_xscale = ds_map_find_value(_arr[i], "xs")
		image_yscale = ds_map_find_value(_arr[i], "ys")
		parameter_name = ds_map_find_value(_arr[i], "param")
		index = ds_map_find_value(_arr[i], "index")
	}

	return _parent_frame




}
