function sc_deal_damage(_action, _pokemon_attack) {
	/// for damaged pokemon
	
	var _dmg = sc_calculate_action_damage(_action, id, _pokemon_attack)

	//STAT pokemon states react on damage
	if ds_exists(states, ds_type_list)
	if not ds_list_empty(states) {
		for (var i=0; i<ds_list_size(states); i++)
		if is_method(states[| i].onDamage)
			_dmg = states[| i].onDamage(_dmg, id, _action, _pokemon_attack, states[| i])

	}
	sc_hurt(_dmg, _pokemon_attack, _action);

	// apply state
	if sc_does_exist(_action[? "active"], undefined, "'_action[? active]' in sc_deal_damage") {
		var _state = ds_map_find_value(_action[? "active"], "state")
		var _state_obj = state_object[_state];
		var _rate = ds_map_find_value(_action[? "active"], "state_rate")
	}
	var ok = false
	
	if not is_like(object_index, ob_barrier)
	if shield <= 0 {
		ok = true
	} else {
	if _action[? "role"] = _ATTACK_ROLE.buff
		ok = true
	}

		if sc_does_exist(_action[? "active"], undefined, "'_action[? active]' in sc_deal_damage") 
		if state_object[_state] = _ABILITY_STATE.wreck
			ok = true	
	if _action[? "role"] = _ATTACK_ROLE.debuff
	if _pokemon_attack != id
		ok = true
	
	if _pokemon_attack != id {
		var _s = ds_list_size(states)
		for (var i = 0; i < _s ; i++) {
			ok = true
			if states[| i] > 0
			if states[| i].object_index = ob_state_reflect {
				ok = false
				if sc_does_exist(_action[? "active"], undefined, "'_action[? active]' in sc_deal_damage") 
				if state_object[_state] = _ABILITY_STATE.wreck{
					ok = true
					break;
				}
				switch _action[? "type"] {
					case _ATTACK_TYPE.front:
					case _ATTACK_TYPE.lunge:
					case _ATTACK_TYPE.melee:
						ok = true
				}
				if ok break;
			}
		}
	} else ok = true;
	
	if sc_does_exist(_action[? "active"], undefined, "'_action[? active]' in sc_deal_damage") 
	if ok {
		_rate = 25*(_rate + 1)
		var _r_ = random_range(0, 100)
		if object_exists(_state_obj)
			// check apply state rate
		if _r_ <= _rate
			sc_apply_state(_state_obj, _dmg, _pokemon_attack, _action);
	}
	
	if _pokemon_attack.trainer != trainer {
		sc_gain_exp(_pokemon_attack, poke_exp.damage, _dmg, undefined)
		if _dmg > 0
			sc_gain_exp(_action, act_exp.success, _dmg, _pokemon_attack)
		else
			sc_gain_exp(_action, act_exp.success, _action[? "rating"], _pokemon_attack)
	}
	
	sc_logging_damage(_pokemon_attack, id, _action, _dmg)

}
