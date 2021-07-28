/// @desc

sc_clear_pokemon(pokemon_map)
ds_map_destroy(pokemon_map)
show_debug_message(object_get_name(object_index) + " (" + string(id)+")'s pokemon map cleared (" + string(real(pokemon_map)) + ")")

var a_map = noone
for(var i=0; i< ds_list_size(action_list); i++) {
	a_map = action_list[| i]
	if sc_does_exist(a_map) {
		if sc_does_exist(a_map[? "active"])
			ds_map_destroy(a_map[? "active"])
		ds_map_destroy(a_map)
	
	}
}

ds_list_destroy(action_list)
ds_list_destroy(delayed_bullet)

ds_list_destroy(states)
ds_list_destroy(in_biome)
ds_list_destroy(prev_in_biome)
