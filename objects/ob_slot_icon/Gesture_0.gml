/// @desc Add

ds_list_add(current_trainer[? "active_pokemon_list"], map)
ds_list_mark_as_map(current_trainer[? "active_pokemon_list"], ds_list_size(current_trainer[? "active_pokemon_list"])-1)
sc_refresh_ui()

