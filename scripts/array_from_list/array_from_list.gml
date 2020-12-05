// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function array_from_list(_list_id) {
	if ds_exists(_list_id, ds_type_list) {
		var _arr = []
		for (var i=0; i<ds_list_size(_list_id); i++)
			_arr[i] = _list_id[| i]
			
		return _arr	
	}
}

function array_from_component_list(_list_id) {
	var _arr = array_from_list(_list_id)
	for (var i=0; i<array_length(_arr); i++)
	if object_exists(_arr[i])
		_arr[i] = object_get_name(_arr[ i])
	else 
		_arr[i] = "unknown_object"
		
	return _arr
}

