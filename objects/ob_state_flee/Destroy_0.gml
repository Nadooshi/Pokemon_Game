/// @desc

// Inherit the parent event
event_inherited();

with pokemon_id {
	courage_threshold = other.old_threshold
	speed_mod = 0
	sc_ai_give_up()
	unselectables--
	if unselectables = 0 {
		sc_composed_remove_component(control_component)
		control_component = prev_control_component
		sc_composed_add_component(control_component)
	}
	canMove = true
}

