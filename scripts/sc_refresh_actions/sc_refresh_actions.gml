function sc_refresh_actions() {
	if is_undefined(current_pokemon) or not ds_exists(current_pokemon, ds_type_map)
		return false;

	
	with ob_normal_frame_action
		instance_destroy()

	// load available actions
	var _all_actions = ds_list_create()
	var _name = ds_map_find_first(current_pokemon[? "actions"])
	var _count = 0
	var _map
	ini_open(pokemon_path)
	while not is_undefined(_name) {
		_map = ds_map_create()
		ds_map_read(_map, ini_read_string("actions", _name, ""))
		if _map[? "level"] <= current_pokemon[? "level"] {
			_all_actions[| _count] = _map
			_count++
		} else
			ds_map_destroy(_map)
		_name = ds_map_find_next(current_pokemon[? "actions"], _name)
	}
	ini_close()


	// create scrollable list of avaliable actions
	var _count = 0
	var _action
	ini_open(pokemon_path)
	while (_count < ds_list_size(_all_actions)) {
		_action = _all_actions[| _count]
		with sc_add_slot_composed(3200 + 64, 8+92*_count, _action[? "name"], action_slot, undefined) {
			map = _action
			// load ability for action
			if not is_undefined(map[? "active"]) {
				var _map_abil = ds_map_create()
				ds_map_read(_map_abil, ini_read_string("abilities", map[? "active"], ""))
				if sc_does_exist(_map_abil)
					map[? "active"] = _map_abil
			}
			// set ui properties
			enabled = (ds_list_find_index(current_pokemon[? "active_actions"], map[? "name"]) = -1)
			index = _count
		}
		_count++
	}
	ds_list_destroy(_all_actions)

	// create list of active actions=	
	var i = 0
	with ob_frame1 {
		i = index
		_name = ds_list_find_value(current_pokemon[? "active_actions"], index)
		if not is_undefined(_name)
		with sc_add_slot_composed(x, y, _name, action_slot, ob_frame_action_active) {
			map = sc_load_action(_name, current_pokemon)
			index = i
		}
	}
		
	ini_close()

	with ob_normal_frame_action
		event_perform(ev_other, ev_user0)




}
