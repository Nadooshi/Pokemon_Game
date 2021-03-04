/// @desc 

if not canMove
	exit

prev_doMove = doMove

if script_exists(scBehaviour) or is_method(scBehaviour) {
	if scBehaviour = sc_player_stop_set {
		if sc_does_exist(target)
			sc_set_behaviour(sc_ai_follow_target)
		else
			sc_set_behaviour(sc_ai_idle)
	}
}

if not sc_does_exist(target)
	plannedActionNum = -1


// process courage
if (counter mod 10) = 0 {
	//enemy influence
	var _tg = sc_find_nearest_target(id, _ATTACK_AFFECT.enemy, 180, 7)
	if not is_undefined(_tg) and _tg > 0  {
		var _d = distance_to_point(_tg.x, _tg.y + 12)
		var _rd = min(90 / _d , 3)
		var _other_force = (_tg.pokemon_map[? "rating"] + _tg.pokemon_map[? "level"] + _tg.health_cur)
		var _u_force = (pokemon_map[? "rating"] + pokemon_map[? "level"] + _tg.health_cur)
		courage_cur = min(max(0, courage_cur - (_other_force / _u_force - 1) * _rd), 100)
	}
	//friend influence
	
	
}
