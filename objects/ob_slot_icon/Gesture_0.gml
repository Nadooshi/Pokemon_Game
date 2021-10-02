/// @desc Add

var _act_list = current_trainer[? "active_pokemon_list"]
ds_list_add(_act_list, map)
ds_list_mark_as_map(_act_list, ds_list_size(_act_list)-1)
sc_refresh_ui()

