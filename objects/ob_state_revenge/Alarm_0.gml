/// @desc Deal damage
if pokemon_id != pokemon_id_attack {
	instance_destroy()	
	exit;
}

pokemon_id.courage_cur = 100

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != id
	switch (pokemon_id.states[| i].object_index) {
	case ob_state_terror:
	case ob_state_flee:
	case ob_state_wastetime:
		instance_destroy(pokemon_id.states[| i])
	}
