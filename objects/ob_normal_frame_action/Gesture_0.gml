/// @desc 

// find first undefined value in 6 items

var _free_slot = -1
for (var i=0; i<6; i++)
if is_undefined(current_pokemon[? "active_actions"][| i]) {
	_free_slot = i
	break
}

if _free_slot > -1 {
	if ds_list_find_index(current_pokemon[? "active_actions"], map[? "name"]) = -1 {
		current_pokemon[? "active_actions"][| _free_slot] = map[? "name"]
		sc_refresh_actions()
	}
}
