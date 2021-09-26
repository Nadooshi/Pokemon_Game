function sc_save_battle_result() {
	// show exp of pokemons and actions from inside trainer map
	
	var _s = ""
	var _a_map, _a
	for (var i=0; i<ds_list_size(player1_trainer[? "pokemon_ids"]); i++) {
		var _id = player1_trainer[? "pokemon_ids"][| i]
		_id.pokemon_map[? "exp"] = _id.cur_exp
		show_message(_id.pokemon_map[? "title"] + " now has " + string(_id.pokemon_map[? "exp"]) + " exp")
		_s = "Attacks exp raised as follows: \n\n"
		for (_a = 0; _a < ds_list_size(_id.action_list); _a++) {
			_a_map = _id.action_list[| _a]
			_s += "   - " + _a_map[? "name"] + " = " + string(_a_map[? "battle_exp"]) + "\n"
		}
		show_message(_s)
	}
}

