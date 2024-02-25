/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = ds_map_find_value(action[? "active"], "state_time");
_t *= 1 + action[? "lvlup_mod"]
hit_count = _t * 2

alarm[0] = period;

sc_logging_state_cursed(pokemon_id, name, "feels a burning pain.")
	
