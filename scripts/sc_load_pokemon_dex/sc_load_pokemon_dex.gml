/// @arg name
/// @arg ds_map_id
function sc_load_pokemon_dex(argument0, argument1) {

	// cannot create ds_map here. Its Id won't be saved outside this script

	var _name = argument0
	var _ds = argument1
	if ds_exists(_ds, ds_type_map) {
		ini_open(pokemon_path)
			ds_map_read(_ds, ini_read_string("pokemons", _name , ""))
			//_ds[? "title"] = sc_remove_hashtag(_ds[? "title"])
			var _map = ds_map_create()
			ds_map_read(_map, ini_read_string("binded_actions", _name , ""))
			ds_map_delete(_ds, "actions")
			ds_map_add_map(_ds, "actions", ds_map_create()) // Fuck the first comment, LOL!!!
			var _action = ds_map_create() 
			var _a_name = ds_map_find_first(_map)
			while not is_undefined(_a_name) {
				ds_map_read(_action, ini_read_string("actions", _a_name, ""))
				// Parameters for action are in 'sc_new_action', 'sc_load_action', 'sc_load_pokemon'
				ds_map_add_map(_ds[? "actions"], _a_name, ds_map_create())
				_ds[? "actions"][? _a_name][? "pa_exp"] = 0
				_ds[? "actions"][? _a_name][? "pa_lvl"] = _action[? "level"]
				_ds[? "actions"][? _a_name][? "pa_levelup"] = false
				_ds[? "actions"][? _a_name][? "pa_prevexp"] = 0
				_ds[? "actions"][? _a_name][? "pa_lvlup_mod"] = 0
				var _result = sc_lvlup_action(_action[? "level"], _action[? "act_force"], 0)
				_ds[? "actions"][? _a_name][? "pa_nextlvl_exp"] = _result.nextlvl_exp
				_a_name = ds_map_find_next(_map, _a_name)
			}
			ds_map_destroy(_action)
			ds_map_destroy(_map)
			
		ini_close()
	}

}
