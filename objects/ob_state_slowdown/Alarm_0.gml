/// @desc Deal damage

if pokemon_id.speed_mod > modify
	pokemon_id.speed_mod = modify

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != id
	switch (pokemon_id.states[| i].object_index) {
	case ob_state_speedup:
		instance_destroy(pokemon_id.states[| i])
	}
