/// @desc

if pokemon_id.trainer = -1
	exit;
	
event_inherited();

with pokemon_id {
	speed_mod = 0
	sc_player_stop_set()
	unselectables--
	if unselectables = 0 {
		sc_composed_remove_component(control_component)
		sc_composed_add_component(prev_control_component)
		control_component = prev_control_component
	}
	sc_canMove(true)
}
