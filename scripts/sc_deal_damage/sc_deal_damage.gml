/// @arg action
/// @arg attacking_pokemon
function sc_deal_damage(argument0, argument1) {

	/// for damaged pokemon

	var _action = argument0
	var _pokemon_attack = argument1
	var _dmg = sc_calculate_action_damage(_action, pokemon_map, _pokemon_attack)

	//STAT pokemon states react on damage
	if ds_exists(states, ds_type_list)
	if not ds_list_empty(states) {
		for (var i=0; i<ds_list_size(states); i++)
		if is_method(states[| i].onDamage)
			_dmg = states[| i].onDamage(_dmg, id, _action, _pokemon_attack, states[| i])

	}
	sc_hurt(_dmg, _pokemon_attack, _action);

	// apply state
	if sc_does_exist(_action[? "active"]) 
	if not is_like(object_index, ob_barrier) {
		var _state = ds_map_find_value(_action[? "active"], "state");
		var _state_obj = state_object[_state];
		var _rate = ds_map_find_value(_action[? "active"], "state_rate");
		_rate = 25*(_rate + 1)
		var _r_ = random_range(0, 100)
		if object_exists(_state_obj)
			// check apply state rate
		if _r_ <= _rate
			sc_apply_state(_state_obj, _dmg, _pokemon_attack, _action);
	}

	sc_gain_exp(_pokemon_attack, poke_exp.damage, _dmg)
	if _dmg > 0
		sc_gain_exp(_action, act_exp.success, _dmg, _pokemon_attack)
	else
		sc_gain_exp(_action, act_exp.success, _action[? "rating"], _pokemon_attack)
		
	sc_logging_damage(_pokemon_attack, id, _action, _dmg)

}
