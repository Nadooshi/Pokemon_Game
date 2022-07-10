/// @desc

with pokemon_id {
	if object_index = ob_player_sleep
		event_perform(ev_destroy, 0)
	sc_canMove(true)
}

event_inherited();

