/// @desc
event_inherited();

with pokemon_id {
	sc_player_stop_set()
	doActionNum = -1
//	sc_clear_trainer(trainer)
	trainer = other.trainer
	unselectables--
	if unselectables = 0 {
		sc_composed_remove_component(control_component)
		sc_composed_add_component(prev_control_component)
		control_component = prev_control_component
	}
	
}

