///@arg trainer_name
///@arg map

function sc_load_trainer_old(argument0, argument1) {

	var _fname = string_lettersdigits(argument0)+".ini"

	var _ds = argument1
	var _plist = noone
	var _list = noone
	var _map = noone
	
	if ds_exists(_ds, ds_type_map) 
	if file_exists("trainer_saves/" + _fname) {
		ini_open("trainer_saves/" + _fname)
			ds_map_read(_ds, ini_read_string("trainer", "map", _ds))
			_plist = ds_list_create()
			
//			_ds[? "inventory"]	= array_create(trainer_inv_size, noone)
//			_ds[? "awards"]		= ds_list_create(); ds_list_clear(_ds[? "awards"])
				
			var i=0
			while ini_key_exists("caught pokemons", string(i)) {
				var _pokemon = ds_map_create()
				ds_map_read(_pokemon, ini_read_string("caught pokemons", string(i), ""))
				_map = ds_map_create() 
				ds_map_read(_map, ini_read_string("actions", string(i), ""))
				ds_map_delete(_pokemon, "actions")
				ds_map_add_map(_pokemon, "actions", _map)
				_list = ds_list_create()
				ds_list_read(_list, ini_read_string("active actions", string(i), ""))
				ds_map_delete(_pokemon, "active_actions")
				ds_map_add_list(_pokemon, "active_actions", _list)
				ds_list_add(_plist, _pokemon)
				ds_list_mark_as_map(_plist, i)
				i++
			}
			ds_map_delete(_ds, "caught_pokemon_list")
			ds_map_add_list(_ds, "caught_pokemon_list", _plist)
			
			// active_pokemon_list contains pokemon maps (for simplicity)
			// indexes from caught_pokemon_list are saved to file
			// (indexes to pokemon maps)
			var _idlist = ds_list_create()
			_list = ds_list_create()
			ds_list_read(_idlist, ini_read_string("trainer", "active pokemons", ""))
			for (i=0; i<ds_list_size(_idlist); i++) {
				var _pokemon = ds_list_find_value(_ds[? "caught_pokemon_list"], _idlist[| i])
				ds_list_add(_list, _pokemon)
			}
			ds_map_delete(_ds, "active_pokemon_list")
			ds_map_add_list(_ds, "active_pokemon_list", _list)
			ds_list_destroy(_idlist)
		ini_close()
	}

}



function sc_load_trainer(_fname) {
	_fname = string_lettersdigits(_fname)+".txt"
	var _s  = ""
	
	if file_exists("trainer_saves/" + _fname) {
		var f = file_text_open_read("trainer_saves/" + _fname)
		_s = file_text_read_string(f)
		file_text_close(f)
		return json_decode(_s)
	}
}
