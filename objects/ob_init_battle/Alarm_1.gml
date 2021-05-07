/// @desc apply aura

with ob_player
	ds_list_clear(in_biome)

with ob_player
	sc_apply_aura(pokemon_map[? "elemental_type"], pokemon_map[? "material_type"])

alarm[1] = 60

