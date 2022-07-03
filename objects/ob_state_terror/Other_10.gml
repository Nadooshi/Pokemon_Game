/// @desc 

// Inherit the parent event
event_inherited();
var _t = ds_map_find_value(action[? "active"], "state_time");
hit_count = _t * 2

damage = ds_map_find_value(action[? "active"], "state_value")
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
	
sc_logging_state_cursed(pokemon_id, name, "the courage was gone.")

