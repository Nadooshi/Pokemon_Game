/// @desc

// Inherit the parent event
event_inherited();

with pokemon_id {
	speed_mod = 0
	canMove = true
	sc_player_stop_set()
	unselectables--
	if unselectables = 0 {
		sc_composed_remove_component(control_component)
		sc_composed_add_component(prev_control_component)
		control_component = prev_control_component
	}
	
}
