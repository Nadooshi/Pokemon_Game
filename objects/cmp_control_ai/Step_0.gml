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
if (counter mod t_process_courage) = 0 {
	//var _tg = sc_find_nearest_target(id, _ATTACK_AFFECT.enemy, 180, 7)
	var _d = 0
	var _tg = noone
	var _u = noone
	var _en_force = 0
	var _fr_force = 0
	var _u_force = pokemon_map[? "rating"] + pokemon_map[? "level"] + health_cur
	with ob_player
	if id != other.id {
		_u = other.id
		_d = distance_to_point(_u.x, _u.y+12)
		_tg = id
		// enemy influence
		if sc_check_affect(_u, _tg, _ATTACK_AFFECT.enemy) 
		if _d<= 180 {
			var _rd = min(60 / _d , courage_max_regen)
			_en_force += (_tg.pokemon_map[? "rating"] + _tg.pokemon_map[? "level"] + _tg.health_cur) * _rd
		}
		//friend influence
		if sc_check_affect(_u, _tg, _ATTACK_AFFECT.friend) 
		if _d<= 180 {
			var _rd = min(90 / _d , courage_max_regen)
			_fr_force += (_tg.pokemon_map[? "rating"] + _tg.pokemon_map[? "level"] + _tg.health_cur) * _rd
		}
	}
	var _mod_courage = (_fr_force + _u_force - _en_force) / _u_force + (0.05 * power_cur)
	courage_cur = clamp(courage_cur + _mod_courage, 0, 100)
	if courage_cur < courage_threshold
		sc_ai_set_flee()
	
}

