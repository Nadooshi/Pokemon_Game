/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}


for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != id
	switch (pokemon_id.states[| i].object_index) {
		case ob_state_teleport: {
			instance_destroy()
			exit;
		}
	}

time_stat = ds_map_find_value(action[? "active"], "state_value")
damage = ds_map_find_value(action[? "active"], "state_time") * PixPerDist
alarm[0] = period;

sc_logging_state_cursed(pokemon_id, name, "going to teleport" + " x" + string(ceil(pokemon_id.x)) + ", y" + string(ceil(pokemon_id.y)))


