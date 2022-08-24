/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = ds_map_find_value(action[? "active"], "state_time");
hit_count = _t * 2

alarm[0] = period;

sc_logging_state_powered(pokemon_id, name, "reduce", "several parameters by", "half")

