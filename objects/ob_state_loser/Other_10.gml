/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = ds_map_find_value(action[? "active"], "state_time");
_t *= 1 + action[? "lvlup_mod"]
hit_count = _t * 2

alarm[0] = period;
modify = (ds_map_find_value(action[? "active"], "state_value")) * 0.01 + action[? "lvlup_mod"]

if pokemon_id.dodge_mod < modify
	pokemon_id.dodge_mod = modify

var _val_txt = string(modify * 100) + "%"
sc_logging_state_powered(pokemon_id, name, "reduce", "dodge", _val_txt)
