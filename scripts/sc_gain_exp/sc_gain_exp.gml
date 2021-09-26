/// @arg object
/// @arg event
/// @arg value
/// @arg attacking_pokemon_id
function sc_gain_exp(_object, _event, _value, _context) {
	// _object = [pokemon instance_id, action ds_map]
	var _pokemon = _object
	var _action = _object
	var _val = 0
	
	switch _event {
	case poke_exp.damage:
	case poke_exp.dodge:
		_val = round(exps[_event] * _value)  // value as dmg
		_pokemon.cur_exp += _val
		if _val > 0
			sc_logging_experience(_pokemon, _val, _event)
		break;
	case poke_exp.kill:
		_val = round(exps[_event] * (_value / _pokemon.pokemon_map[? "level"]))
		_pokemon.cur_exp +=  _val
		if _val > 0
			sc_logging_experience(_pokemon, _val, _event)
		break
	case act_exp.use: 
		_pokemon = _context
		if ds_map_exists(_action, "num")
			_action = _pokemon.action_list[| _action[? "num"]]
		_val = round(_action[? "battle_exp"] + _action[? "ap"] * exps[act_exp.use])
		_action[? "battle_exp"] = _val
		if _val > 0
			sc_logging_experience(_action, _val, _event)
		break
	case act_exp.success:
		// value as dmg
		_pokemon = _context
		if ds_map_exists(_action, "num")
			_action = _pokemon.action_list[| _action[? "num"]]
		_val = round(_value * exps[act_exp.success])
		_action[? "battle_exp"] = _action[? "battle_exp"] + _val
		if _val > 0
			sc_logging_experience(_action, _val, _event)
		break
	}

}
