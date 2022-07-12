/// @desc apply aura

with ob_player {
	ds_list_copy(prev_in_biome, in_biome)
	ds_list_clear(in_biome)
}

with ob_player {
	sc_apply_aura(pokemon_map[? "elemental_type"], pokemon_map[? "material_type"], 5 * PixPerDist)
	
// apply room aura

	if ds_list_find_index(in_biome, _MATERIAL.plant) = -1
		ds_list_add(in_biome, _MATERIAL.plant)
	
	if clear_sky
	if ds_list_find_index(in_biome, _MATERIAL.solar) = -1
		ds_list_add(in_biome, _MATERIAL.solar)
	clear_sky = true
}

alarm[1] = 60

