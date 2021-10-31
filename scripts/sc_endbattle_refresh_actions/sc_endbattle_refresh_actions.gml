function sc_endbattle_refresh_actions(){
	if is_undefined(current_pokemon) or not ds_exists(current_pokemon, ds_type_map)
		return false;
		
	// create list of active actions
	with ob_frame_action_active
		instance_destroy()
		
	var _name
	
	var i = 0
	ini_open(pokemon_path)
	with ob_frame1 {
		i = index
		_name = ds_list_find_value(current_pokemon[? "active_actions"], index)
		if not is_undefined(_name)
		with sc_add_slot_composed(x, y, _name, action_slot, ob_endbattle_frame_action) {
			map = sc_load_action(_name, current_pokemon)
			index = i
		}
	}
		
	ini_close()

	with ob_frame_action_active
		event_perform(ev_other, ev_user0)

}
