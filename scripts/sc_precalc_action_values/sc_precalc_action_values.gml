function sc_precalc_action_values(a_map, pokemon_id){
	if not sc_does_exist(a_map) or not sc_does_exist(pokemon_id)
		return false
		
	// _ATTACK_TYPE.range
	a_map[? "distance"] = max(6, (a_map[? "range"] * 18) - 12)  // 60 * 0.1 * moveSpeed (3)

	switch a_map[? "type"] {
	case _ATTACK_TYPE.lunge:
		a_map[? "distance"] = (pokemon_id.pokemon_map[? "ap"] * 0.66) * a_map[? "range"] * 6
	break
	case _ATTACK_TYPE.swoop:
		a_map[? "distance"] = 6 * a_map[? "range"] * pokemon_id.maxSpeed * 1.5
	break
	case _ATTACK_TYPE.front:
	case _ATTACK_TYPE.melee:
		a_map[? "distance"] = 6
	break
	case _ATTACK_TYPE.pool:
		a_map[? "distance"] = (a_map[? "radius"] + 1) * 8
	break;
	case _ATTACK_TYPE.aura:
	case _ATTACK_TYPE.barrier:
		//
	break;
	
	}
	
	return true

}
