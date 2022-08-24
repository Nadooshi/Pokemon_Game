/// @desc Deal damage
event_inherited()
alarm[0] = period;
power_reg = 0.1

if --hit_count < 0
	instance_destroy()
	
for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != id
	switch (pokemon_id.states[| i].object_index) {
	case ob_state_powerup:
	case ob_state_meleeup:
	case ob_state_rangeup:
		instance_destroy(pokemon_id.states[| i])
	}
