/// @desc apply aura

with ob_player {
	ds_list_copy(prev_in_biome, in_biome)
	ds_list_clear(in_biome)
	sc_apply_aura(pokemon_map[? "elemental_type"], pokemon_map[? "material_type"], 5 * PixPerDist)
	
	// apply room aura
	if clear_sky
	if is_pmTime {
	if ds_list_find_index(in_biome, _MATERIAL.lunar) = -1
		ds_list_add(in_biome, _MATERIAL.lunar)
	} else {
	if ds_list_find_index(in_biome, _MATERIAL.solar) = -1
		ds_list_add(in_biome, _MATERIAL.solar)
	}
	
	switch weather {
		case _WEATHER.foggy:
		case _WEATHER.cloudy:
		case _WEATHER.clear:
			clear_sky = true
			break;
		case _WEATHER.rainy:
		case _WEATHER.stormy:
			clear_sky = false
	}
	switch fallout {
		case _FALLOUT_TYPE.rain :{
			if ds_list_find_index(in_biome, _MATERIAL.water) = -1
				ds_list_add(in_biome, _MATERIAL.water)
			break;
		}
		case _FALLOUT_TYPE.snow :{
			if ds_list_find_index(in_biome, _MATERIAL.frozen) = -1
				ds_list_add(in_biome, _MATERIAL.frozen)
			break;
		}
		case _FALLOUT_TYPE.ember :{
			if ds_list_find_index(in_biome, _MATERIAL.flame) = -1
				ds_list_add(in_biome, _MATERIAL.flame)
			break;
		}
	}
	
	if ds_list_find_index(in_biome, _MATERIAL.plant) = -1
		ds_list_add(in_biome, _MATERIAL.plant)
	
}
#macro time_refresh_aura 30
alarm[1] = time_refresh_aura * 2

