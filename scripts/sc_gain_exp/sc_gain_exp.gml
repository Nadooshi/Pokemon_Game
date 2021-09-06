function sc_gain_exp(_object, _event, _value, _info) {
	// _object = [pokemon instance_id, action ds_map]
	var _pokemon = _object
	var _action = _object
	
	switch _event {
	case poke_exp.damage:
	case poke_exp.dodge:
		_pokemon.cur_exp += exps[_event] * _value  // value as dmg
		if not is_undefined(_info) {
			// logging	
		}
		return _pokemon.cur_exp
		break;
	case poke_exp.kill:
		_pokemon.cur_exp += exps[_event]
		
		return _pokemon.cur_exp
		break
	case act_exp.use: 
		_action[? "battle_exp"] = _action[? "battle_exp"] + _action[? "ap"] * exps[act_exp.use]
		break
	case act_exp.success:
		// value as dmg
		_action[? "battle_exp"] = _action[? "battle_exp"] + _value * exps[act_exp.success]
		break
	}
	
	
	
}
