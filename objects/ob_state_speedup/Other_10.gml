/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = ds_map_find_value(action[? "active"], "state_time");
_t *= 1 + action[? "lvlup_mod"]
hit_count = _t * 2

alarm[0] = period;
modify = 0.25 * ds_map_find_value(action[? "active"], "state_value")

var _val_txt = string(ds_map_find_value(action[? "active"], "state_value"))
sc_logging_state_powered(pokemon_id, name, "gaining", "speed", _val_txt)

