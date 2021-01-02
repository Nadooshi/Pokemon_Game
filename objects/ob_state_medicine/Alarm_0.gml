/// @desc Deal damage

with pokemon_id 
	if (health_cur + other.damage) > health_max
		health_cur = health_max
	else
		health_cur += other.damage

sc_logging_state_rises(pokemon_id, name, "providing assistance", "health", damage)

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != id
	switch (pokemon_id.states[| i].object_index) {
	case ob_state_bleeding:
	case ob_state_infestation:
	case ob_state_leech:
	case ob_state_burn:
		instance_destroy(pokemon_id.states[| i])
	}
