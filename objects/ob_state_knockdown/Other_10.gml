/// @desc 
if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _s = 0.5 // chance use stat
var sz_dif = pokemon_id_attack.size - pokemon_id.size
//if sz_dif > 0 _s = 1

if sz_dif < 0 {
	instance_destroy()
	exit
}
if sz_dif = 0 {
	var _r = random(1)
	if _r < _s {
		instance_destroy()
		exit
	}
}

//====================================================================================
var _t = ds_map_find_value(action[? "active"], "state_time");
hit_count = _t * 2

alarm[0] = period;

knock_dir = point_direction(action[? "lastX"], action[? "lastY"], pokemon_id.x, pokemon_id.y + 12)

sc_logging_state_cursed(pokemon_id, name, "thrown to the side")
