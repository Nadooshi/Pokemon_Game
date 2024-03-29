/// @arg map
/// @arg trainer
function sc_create_player(argument0, argument1) {

	var _map = argument0
	var _trainer = argument1
	var _result = noone
	var _sp = noone
	var _acc = [0.3 , 0.1, 0.05 ,0.01]
	
	with instance_create_layer(0, 0, "Game", ob_player) {
		// create pokemon
		_result = id
		trainer = _trainer
		pokemon_map = _map
		size = pokemon_map[? "size"]
		dAngle = 5 - pokemon_map[? "size"]
		health_max = pokemon_map[? "health"]
		health_cur = health_max
		maxSpeed =  pokemon_map[? "ap"] * 0.25
		accel = _acc[size]
		pokemon_map[? "prev_exp"] = pokemon_map[? "exp"]
		_sp = asset_get_index("sp_pokeworld_" + string(pokemon_map[? "face"]))
		if sprite_exists(_sp)
			sprite_index = _sp
		if pokemon_map[? "size"] = _SIZE.giant { 
			image_xscale = 1.5
			image_yscale = 1.5
		}
	
		// create action list
		ds_list_clear(action_list)
		var a_list = pokemon_map[? "active_actions"]
		var a_map;
		ini_open(pokemon_path)
		for (var i=0; i<ds_list_size(a_list); i++) {
			a_map = undefined
			if not is_undefined(a_list[| i]) {
				a_map = sc_load_action(a_list[| i], pokemon_map)
				if not sc_precalc_action_values(a_map, id)
					show_message("NO distance calculated")
			}
			ds_list_add(action_list, a_map)
		}
		// load passives
		if not is_undefined(pokemon_map[? "passive_1"])
		if pokemon_map[? "passive_1"] != "" {
			passive_state1 = ds_map_create()
			ds_map_read(passive_state1, ini_read_string("abilities", pokemon_map[? "passive_1"], ""))
		}
		if not is_undefined(pokemon_map[? "passive_2"])
		if pokemon_map[? "passive_2"] != "" {
			passive_state2 = ds_map_create()
			ds_map_read(passive_state2, ini_read_string("abilities", pokemon_map[? "passive_2"], ""))
		}
		ini_close()
	
		// set start position 
		switch pokemon_map[? "position_stage"] {
		case _POSITION.fly:
			event_perform(ev_other, ev_user4)
			break
		case _POSITION.underground:
			event_perform(ev_other, ev_user2)
			break
		}
	
	}

	return _result



}
