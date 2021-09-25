/// @arg name
/// @arg ds_map_id
function sc_load_pokemon_dex(argument0, argument1) {

	// cannot create ds_map here. Its Id won't be saved outside this script

	var _name = argument0
	var _ds = argument1
	if ds_exists(_ds, ds_type_map) {
		ini_open(pokemon_path)
			ds_map_read(_ds, ini_read_string("pokemons", _name , ""))
			_ds[? "title"] = sc_remove_hashtag(_ds[? "title"])
			var _map = ds_map_create()
			ds_map_read(_map, ini_read_string("binded_actions", _name , ""))
			ds_map_delete(_ds, "actions")
			ds_map_add_map(_ds, "actions", _map)
		ini_close()
	}

}
