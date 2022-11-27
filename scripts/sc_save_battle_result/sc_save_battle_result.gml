function sc_save_battle_result() {
	// show exp of pokemons and actions from inside trainer map
	var prise = 100
	if current_trainer = trainer_loser 
		prise = 0
	
	
	var _a_map, _a
	for (var i=0; i<ds_list_size(current_trainer[? "pokemon_ids"]); i++) {
		var _id = current_trainer[? "pokemon_ids"][| i]
		_id.pokemon_map[? "exp"] += (_id.cur_exp + (prise * _id.pokemon_map[? "level"]))
		
		for (_a = 0; _a < ds_list_size(_id.action_list); _a++) {
			_a_map = _id.action_list[| _a]
			if not is_undefined(_a_map) {
				var _p_action = _id.pokemon_map[? "actions"][? _a_map[? "name"]] 
				// lvlup action
				_a_map[? "levelup"] = false
				do {
					var _result = sc_lvlup_action(_a_map[? "level"], _a_map[? "act_force"], _a_map[? "battle_exp"])
					_a_map[? "prev_exp"] = _p_action[? "pa_exp"]
					if _result.lvlup {
						if _a_map[? "level"] < _id.pokemon_map[? "level"] {
							_a_map[? "battle_exp"] = _result.exceeding_exp
							_a_map[? "level"]++
							_a_map[? "levelup"] = true
							if is_undefined(_p_action[? "pa_lvlup_mod"]) _p_action[? "pa_lvlup_mod"] = 0
							_p_action[? "pa_lvlup_mod"] += 0.01 // modificator in % for any stats and buffes
						} else {
							// border max exp with nextlvl_exp 
							_a_map[? "battle_exp"] = _result.nextlvl_exp
							_result.lvlup = false
							// choose evolve pokemon or not
						}
					}
				} until _result.lvlup = false
				_p_action[? "pa_nextlvl_exp"] = _result.nextlvl_exp
				_p_action[? "pa_prevexp"] = _a_map[? "prev_exp"]
				_p_action[? "pa_exp"] = _a_map[? "battle_exp"]
				_p_action[? "pa_lvl"] = _a_map[? "level"]
				_p_action[? "pa_levelup"] = _a_map[? "levelup"]
				_p_action[? "pa_lvlup_mod"] = _a_map[? "lvlup_mod"]
			}
		}
	}
}

