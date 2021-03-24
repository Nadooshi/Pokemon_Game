/// @desc Deal damage

with pokemon_id {
	sc_set_behaviour(sc_ai_wastetime)
	target = noone
}

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
