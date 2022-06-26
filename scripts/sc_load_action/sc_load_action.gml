// ini file should be already opened
// returns action map 

function sc_load_action(_name, _pokemon_map){
	var map = ds_map_create()
	
	ds_map_read(map, ini_read_string("actions", _name, ""))
	// set damage by level
	var _ratio = 0
	if map[? "damage"] != 0
		_ratio = map[? "dmg_element"] / map[? "damage"]
	
	map[? "damage"] = sc_calculate_formula(5, map[? "act_force"], _pokemon_map[? "actions"][? _name][? "pa_lvl"], map[? "ap"], map[? "damage" ], map[? "level"])
	map[? "dmg_element" ] = map[? "damage"] * _ratio
	map[? "dmg_material"] = map[? "damage"] - map[? "dmg_element"]
	//
	map[? "prev_exp"   ] = _pokemon_map[? "actions"][? _name][? "pa_prevexp"]
	map[? "battle_exp" ] = _pokemon_map[? "actions"][? _name][? "pa_exp"]
	map[? "level"	   ] = _pokemon_map[? "actions"][? _name][? "pa_lvl"]
	map[? "nextlvl_exp"] = _pokemon_map[? "actions"][? _name][? "pa_nextlvl_exp"]
	map[? "levelup"] = _pokemon_map[? "actions"][? _name][? "pa_levelup"]
	_pokemon_map[? "actions"][? _name][? "pa_levelup"] = false
	map[? "lvlup_mod" ] = ((_pokemon_map[? "actions"][? _name][? "pa_lvlup_mod"]) ?? 0)
	
	var _cd = 0
	if _pokemon_map[? "actions"][? _name][? "repeatable"] = true // true => не повторяется
		_cd = disposable_action_cooldown
	map[? "cooldown"] = _cd
	
	if not is_undefined(map[? "active"]) {
		var _map_abil = ds_map_create()
		ds_map_read(_map_abil, ini_read_string("abilities", map[? "active"], ""))
		if sc_does_exist(_map_abil)
			map[? "active"] = _map_abil
	}
	
	return map
}
