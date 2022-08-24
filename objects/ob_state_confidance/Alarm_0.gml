/// @desc Deal damage
event_inherited()
alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != id
	switch (pokemon_id.states[| i].object_index) {
	case ob_state_confusion:
	case ob_state_loser:
	case ob_state_slowdown:
	case ob_state_stun:
	case ob_state_terror:
	case ob_state_weak:
	case ob_state_lulling:
	case ob_state_flee:
	case ob_state_wastetime:
		instance_destroy(pokemon_id.states[| i])
	}



