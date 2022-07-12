
var inHab = ds_list_create()
var _s = instance_place_list(x, y, ob_player, inHab, false)
for (var i = 0; i < _s; i++) {
	with inHab[| i] {
		on_surface_type = _SURF_TYPE.surf_liquid
		// apply aura
		if ds_list_find_index(in_biome, _ELEMENTAL.water) = -1
			ds_list_add(in_biome, _ELEMENTAL.water)
	}

}

event_inherited();

ds_list_destroy(inHab)

