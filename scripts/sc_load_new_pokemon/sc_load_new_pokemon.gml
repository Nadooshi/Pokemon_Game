/// @arg name - loaded pokemon
function sc_load_new_pokemon(argument0) {

	var _name = argument0
	var _pokemon = ds_map_create()

	sc_load_pokemon_dex(_name, _pokemon)

		_pokemon[? "exp"] = 0
		_pokemon[? "level"] = 1 // 1 lvl in start
		_pokemon[? "loses"] = 0
		_pokemon[? "wins"] = 0
		_pokemon[? "artefact"] = noone
		_pokemon[? "berry"] = noone
		_pokemon[? "potion"] = noone
		ds_map_add_list(_pokemon, "active_actions", ds_list_create())

	return _pokemon

}
