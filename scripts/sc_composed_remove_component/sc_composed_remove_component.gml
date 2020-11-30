/// @arg component_object
/// @arg [perform_destroy=false]
function sc_composed_remove_component() {

	var _cmp = argument[0]
	var _event = false
	if argument_count > 1 
		_event = argument[1]

	if not object_exists(_cmp)
		exit

	var _cmp_index = ds_list_find_index(component_list, _cmp)
	if _cmp_index != -1 {
		ds_list_delete(component_list, _cmp_index)
		component_count = ds_list_size(component_list)
		if _event
			event_perform_object(_cmp, ev_destroy, 0)
	}


}
