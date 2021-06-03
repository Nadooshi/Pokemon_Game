/// @arg select = true
function sc_set_selected(_id, _selected) {
	if not sc_does_exist(_id)
		return;
	with _id {
		selected = _selected
		if _selected {
			if unselectables > 0
				return;
			selected_id = id
			sc_composed_remove_component(control_component)
	//			sc_composed_add_component(cmp_control_keyb, true)
			control_component = cmp_control_touch
			sc_composed_add_component(control_component, true)
			sc_set_behaviour(sc_player_stop_set)
			sc_player_stop_set()
//			attack_warmup = 0
//			doActionNum = -1
			target = ob_cursor
		} else {
	//			sc_composed_remove_component(cmp_control_keyb)
			selected_id = noone
			sc_composed_remove_component(control_component)
			control_component = cmp_control_ai
			if sc_composed_add_component(control_component) != -1
				sc_ai_give_up()
		}
	}
}
