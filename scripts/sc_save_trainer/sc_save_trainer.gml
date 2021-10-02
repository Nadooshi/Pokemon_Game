function sc_save_trainer() {
	
	// save in active_pokemon_list indexes from caught_pokemon_list
	var _list = current_trainer[? "active_pokemon_list"]
	var _nums = ds_list_create()
	for (var i=0; i<ds_list_size(_list); i++)
		ds_list_add(_nums, ds_list_find_index(current_trainer[? "caught_pokemon_list"], _list[| i]))
	
	//current_trainer[? "caught_pokemon_list"] = _nums
	ds_map_delete(current_trainer, "active_pokemon_list")
	ds_map_add_list(current_trainer, "active_pokemon_list", _nums)
	
	var fname  = "trainer_saves/" + string_lettersdigits(current_trainer[? "name"])+".txt"
	var f = file_text_open_write(fname)
	var _s = json_encode(current_trainer)
		file_text_write_string(f, _s)
	file_text_close(f)
		
	ds_map_delete(current_trainer, "active_pokemon_list")
	ds_map_add_list(current_trainer, "active_pokemon_list", _list)
	
	ds_list_destroy(_nums)

}
