/// @desc Deal damage

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
with pokemon_id {
	target = noone
	if scBehaviour != sc_ai_move_idle
		sc_set_behaviour(sc_ai_wastetime)
}
