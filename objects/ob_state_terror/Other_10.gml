/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = ds_map_find_value(action[? "active"], "state_time");
_t *= 1 + action[? "lvlup_mod"]
hit_count = _t * 2

damage = ds_map_find_value(action[? "active"], "state_value") * (1 + action[? "lvlup_mod"])

switch action[? "type"] {
	case _ATTACK_TYPE.wave:
		pokemon_id.fear_cur += damage * 0.2 // div 5
	break;
	case _ATTACK_TYPE.cloud:
	case _ATTACK_TYPE.pool:
		pokemon_id.fear_cur += damage / hit_count
	break;
	default:
		pokemon_id.fear_cur += damage
		
}

alarm[0] = period;
	
sc_logging_state_loses(pokemon_id, name, "courage was gone.", "", damage)

