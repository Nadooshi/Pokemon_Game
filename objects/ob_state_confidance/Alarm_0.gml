/// @desc Deal damage
	
alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != id
	switch (pokemon_id.states[| i].object_index) {
	case ob_state_confusion:
	case ob_state_loser:
	case ob_state_paralyze:
	case ob_state_slowdown:
	case ob_state_stun:
	case ob_state_terror:
	case ob_state_weak:
		instance_destroy(pokemon_id.states[| i])
	}


