/// @desc swich animatin
alarm_set(0, 30)
var _tg_pokemon = sc_find_pokemon_to_target()
if is_undefined(_tg_pokemon)
	exit
	
var _p_target_elem = 0
_p_target_elem[_e.element] = (_tg_pokemon.pokemon_map[? "elemental_type"] != _ELEMENTAL.none) ? element_table[_tg_pokemon.pokemon_map[? "elemental_type"]] : -1  // _e - enum in sc_calculate_action_damage
_p_target_elem[_e.material] = (_tg_pokemon.pokemon_map[? "material_type"] != _MATERIAL.none) ? element_table[_tg_pokemon.pokemon_map[? "material_type"]] : -1 

var _elem_action = map[? parameter_name]


for (var _pe = 0; _pe < 2; _pe++) 
if is_array(_p_target_elem[_pe]) {
	var _table_entry = _p_target_elem[_pe]
	var _dmg_coeff = 1
	if array_length(_table_entry)=3 {
		_dmg_coeff *= (_table_entry[0] == _elem_action) ? 0.5 : 1
		_dmg_coeff *= (_table_entry[1] == _elem_action) ? 2 : 1
		_dmg_coeff *= (_table_entry[2] == _elem_action) ? 2 : 1
	}
}

if _dmg_coeff = 1
	if skeleton_animation_get() != "Rotate"
		skeleton_animation_set("Rotate")
if _dmg_coeff < 1 
	if skeleton_animation_get() != "Deactive"
		skeleton_animation_set("Deactive")
if _dmg_coeff > 1
	if skeleton_animation_get() != "Active"
		skeleton_animation_set("Active")

