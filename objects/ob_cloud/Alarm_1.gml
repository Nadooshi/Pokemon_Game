/// @desc apply state, aura, weather

alarm_set(1, time_refresh_aura * 0.5)
var col_list = ds_list_create()
var _c = instance_place_list(x,y,ob_player, col_list, false)
for (var i = 0; i < _c; i++) 
	with col_list[| i] {
		if ds_list_find_index(in_biome, _MATERIAL.water) = -1
			ds_list_add(in_biome, _MATERIAL.water)
		if ds_list_find_index(in_biome, _MATERIAL.mystic) = -1
			ds_list_add(in_biome, _MATERIAL.mystic)
		sc_apply_state(ob_state_confusion, 0, col_list[| i], other.fog_action)
		clear_sky = false
	}

ds_list_destroy(col_list)

