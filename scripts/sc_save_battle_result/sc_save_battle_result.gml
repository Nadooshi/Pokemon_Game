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
				//  pokemon_map[? "actions"] is a map containing "pa_exp", "pa_lvl" (dynamic values) . Its keys are action names.
				// _p_action is a map with that dynamic values for every action in pokemon
				//_s += "   - " + _a_map[? "name"] + " = " + string(_a_map[? "battle_exp"]) + "\n"
				_p_action[? "pa_exp"] = _a_map[? "battle_exp"]
				_p_action[? "pa_lvl"] = _a_map[? "cur_lvl"]
			}
		}
		//show_message(_s)
	}
}

