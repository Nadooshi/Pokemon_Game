/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = ds_map_find_value(action[? "active"], "state_time");
_t *= 1 + action[? "lvlup_mod"]
hit_count = _t * 2

alarm[0] = period;
var val = ds_map_find_value(action[? "active"], "state_value");
pokemon_id.shield += val * (1 + action[? "lvlup_mod"])


var _val_txt = string(pokemon_id.shield)
sc_logging_state_powered(pokemon_id, name, "creating", "defence orb", _val_txt)

