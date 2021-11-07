/// @desc create list(map) of pokemon slots to tap through

var _pokemon
with ob_endbattle_slot_face  {
	_pokemon = map[? parameter_name][| index]
	if not is_undefined(_pokemon)
		other.slots_map[? index] = id
}

alarm[0] = 1
