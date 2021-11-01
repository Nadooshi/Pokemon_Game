function sc_save_battle_result() {
	// show exp of pokemons and actions from inside trainer map
	var prise = 1
	if current_trainer = trainer_loser
		prise = 0.5
	
//	var _s = ""
	var _a_map, _a
	for (var i=0; i<ds_list_size(current_trainer[? "pokemon_ids"]); i++) {
		var _id = current_trainer[? "pokemon_ids"][| i]
		_id.pokemon_map[? "exp"] += (_id.cur_exp * prise)
		
		//show_message(_id.pokemon_map[? "title"] + " now has " + string(_id.pokemon_map[? "exp"]) + " exp")
		//_s = "Attacks exp raised as follows: \n\n"
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
						} else {
							// ограничить макс exp with nextlvl_exp
							_a_map[? "battle_exp"] = _result.nextlvl_exp
							_result.lvlup = false
						}
					}
				} until _result.lvlup = false
				//
//				var _result = sc_lvlup_action(_a_map[? "level"], _a_map[? "act_force"], _a_map[? "battle_exp"])
				_p_action[? "pa_nextlvl_exp"] = _result.nextlvl_exp
				_p_action[? "pa_prevexp"] = _a_map[? "prev_exp"]
				_p_action[? "pa_exp"] = _a_map[? "battle_exp"]
				_p_action[? "pa_lvl"] = _a_map[? "level"]
			}
		}
		//show_message(_s)
	}
}

