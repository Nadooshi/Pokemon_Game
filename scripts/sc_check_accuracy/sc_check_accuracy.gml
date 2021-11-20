/// @arg bullet_or_damage_area_id
/// @arg target_pokemon_id
/// @arg action
function sc_check_accuracy(argument0, argument1, argument2) {
	var _obj = argument0
	var _tg_p = argument1
	var _action = argument2

	var _rate_coeff = 1;
	if ds_list_find_index(_obj.list_missed, _tg_p) = -1 {
		switch _tg_p.pokemon_map[? "size"] {
		case _SIZE.tiny:
			_rate_coeff = 0.75
			break
		case _SIZE.normal:
			_rate_coeff = 1
			break
		case _SIZE.big:
			_rate_coeff = 1.33
			break
		case _SIZE.giant:
			_rate_coeff = 2
			break
		}
		_rate_coeff += _tg_p.dodge_mod // !!! dodge_mod reduce dodge 
		var _hit_rate = _action[? "accuracy"] * (_rate_coeff + _obj.accuracy_mod)
		var _random = random(1.0)
		if _random <= _hit_rate
			return true
	
		with instance_create_layer(x, y, "Particles", ob_particle_text)
			caption = "MISS!"
			
		ds_list_add(_obj.list_missed, _tg_p)	
		sc_logging_miss(_obj.pokemon_id, _tg_p, _action)
		var _dmg = sc_calculate_action_damage(_action, _tg_p.pokemon_map, _obj)
		if _tg_p.trainer != -1
			sc_gain_exp(_tg_p, poke_exp.dodge, _dmg, undefined)
	}

	return false



}
