/// @desc Deal damage

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != id
	switch (pokemon_id.states[| i].object_index) {
	case ob_state_dextery:
	case ob_state_meleeup:	
	case ob_state_rangeup:	
	case ob_state_powerup:
		instance_destroy(pokemon_id.states[| i])
	}
