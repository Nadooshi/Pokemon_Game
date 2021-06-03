function sc_set_move_component(_cmp) {
	var _prevcmp = component_list[| move_component_index]
	if _prevcmp != _cmp {
		event_perform_object(_prevcmp, ev_cleanup, 0)
		component_list[| move_component_index] = _cmp
		event_perform_object(_cmp, ev_create, 0)
	}
}
