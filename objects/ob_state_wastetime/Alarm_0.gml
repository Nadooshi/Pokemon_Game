/// @desc Deal damage

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
with pokemon_id {
	sc_ai_give_up()
	if scBehaviour != sc_ai_move_idle
		sc_set_behaviour(sc_ai_wastetime)
}
