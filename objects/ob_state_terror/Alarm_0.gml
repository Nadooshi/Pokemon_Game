/// @desc Deal damage
event_inherited()
alarm[0] = period;
if --hit_count < 0
	instance_destroy()


if pokemon_id.courage_cur < pokemon_id.courage_threshold
for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != id
	switch (pokemon_id.states[| i].object_index) {
	case ob_state_lulling:{
		pokemon_id.courage_cur = 0
		sc_logging_state_cursed(pokemon_id, name, "wakes up in cold sweat.")
	}
	case ob_state_dextery:
	case ob_state_meleeup:
	case ob_state_rangeup:
	case ob_state_powerup:
		instance_destroy(pokemon_id.states[| i])
	}
