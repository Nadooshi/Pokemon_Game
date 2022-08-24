/// @desc Deal damage
event_inherited()
with pokemon_id {
	if object_index = ob_player_flying
		event_perform(ev_destroy, 0)
}


alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
