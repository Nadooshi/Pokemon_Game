function sc_state_check_compatible_biome(_action) {
	// for ob_pokemon
	var _biome_sign = ds_map_find_value(_action[? "active"], "biome_sign")
	var _biome = ds_map_find_value(_action[? "active"], "biome")
	
	if _biome = _ELEMENTAL.none
		return true
		
	for (var i=0; i<ds_list_size(in_biome); i++) {
		if in_biome[| i] = _biome {
			if _biome_sign = 0   // only if biome present (YES)
				return true
			if _biome_sign = 1  // only if NO in biomes
				return false
		}
	}
	if _biome_sign = 0  // only if biome present (YES)
		return false
	if _biome_sign = 1  // only if NO in biomes
		return true
	
}

