/// @desc


// Inherit the parent event
event_inherited();
var mod_reg = 1

var mod_reg = 1
if ds_exists(in_biome, ds_type_list)
for (var i=0; i<ds_list_size(in_biome); i++) {
	var _coeff = 1
	_coeff *= sc_element_coeff(in_biome[| i], pokemon_map[? "elemental_type"])
	_coeff *= sc_element_coeff(in_biome[| i], pokemon_map[? "material_type"])
	if _coeff > 1
		mod_reg *= 1.5
	if _coeff < 1
		mod_reg *= 0.5
}


if floor(power_cur) < power_max 	// recover power
	power_cur += power_reg * mod_reg

