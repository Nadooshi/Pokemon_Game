/// @arg [clear_memory=false]
function sc_composed_remove_all_components() {
	var _clear = false
	if argument_count>0
		_clear = argument[0]
	
	if _clear
		ds_list_destroy(component_list)

	component_list = noone
	component_count = 0

}
