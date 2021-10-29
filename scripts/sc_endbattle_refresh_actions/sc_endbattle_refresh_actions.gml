function sc_endbattle_refresh_actions(){
	if is_undefined(current_pokemon) or not ds_exists(current_pokemon, ds_type_map)
		return false;
		
	// create list of active actions
	with ob_frame_action_active
		instance_destroy()
		
	var _ratio = 1
	var _name
	
	var i = 0
	ini_open(pokemon_path)
	with ob_frame1 {
		i = index
		_name = ds_list_find_value(current_pokemon[? "active_actions"], index)
		if not is_undefined(_name)
		with sc_add_slot_composed(x, y, _name, action_slot, ob_endbattle_frame_action) {
			map = ds_map_create()
			ds_map_read(map, ini_read_string("actions", _name, ""))
			_ratio = map[? "dmg_element"] / map[? "damage"]
			map[? "damage"] = sc_calculate_formula(5, map[? "act_force"], current_pokemon[? "level"], map[? "ap"], map[? "damage" ], map[? "level"])
			map[? "dmg_element" ] = map[? "damage"] * _ratio
			map[? "dmg_material"] = map[? "damage"] - map[? "dmg_element"]
			map[? "nextlvl_exp"] = 99999
			map[? "battle_exp"] = current_pokemon[? "actions"][? _name][? "pa_exp"]
			map[? "level"	  ] = current_pokemon[? "actions"][? _name][? "pa_lvl"]
			if not is_undefined(map[? "active"]) {
				var _map_abil = ds_map_create()
				ds_map_read(_map_abil, ini_read_string("abilities", map[? "active"], ""))
				if sc_does_exist(_map_abil)
					map[? "active"] = _map_abil
			}
			index = i
		}
	}
		
	ini_close()

	with ob_frame_action_active
		event_perform(ev_other, ev_user0)

}
