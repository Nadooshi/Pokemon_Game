/// @desc 

//ds_list_delete(current_pokemon[? "active_actions"], index)
current_pokemon[? "active_actions"][| index] = undefined

sc_refresh_actions()
