function sc_process_courage(mod_boost) {
// for ob_player

	var _d = 0
	var _tg = noone
	var _u = noone
	var _en_force = 0
	var _fr_force = 0
	var _u_force = pokemon_map[? "rating"] + pokemon_map[? "level"] + health_cur
	var _fear = 1 + fear_cur * 0.01 // over 100% for boost _en_force
	var _result = 0
	with ob_player
	if not is_like(id.object_index, ob_barrier)
	if id != other.id {
		_u = other.id
		_d = distance_to_point(_u.x, _u.y+12)
		_tg = id
		// enemy influence
		if sc_check_affect(_u, _tg, _ATTACK_AFFECT.enemy) 
		if _d<= max_distance_attack {
			var _rd = min(60 / _d , courage_max_regen)
			_en_force += (_tg.pokemon_map[? "rating"] + _tg.pokemon_map[? "level"] + _tg.health_cur) * _rd
			_en_force *= _fear
		}
		//friend influence
		if sc_check_affect(_u, _tg, _ATTACK_AFFECT.friend) 
		if _d<= max_distance_attack {
			var _rd = min(90 / _d , courage_max_regen)
			_fr_force += (_tg.pokemon_map[? "rating"] + _tg.pokemon_map[? "level"] + _tg.health_cur) * _rd
		}
	}
	var _mod_courage = (_fr_force + _u_force - _en_force) / _u_force + (0.06 * power_cur)
	_mod_courage *= mod_boost
	_result = _mod_courage
	
	return _result

}