/// @desc

if ds_exists(action, ds_type_map) {
	var sprites = array_create(2)
	sprites[0] = asset_get_index("sp_particle_elemental" + string(action[? "element"]))
	sprites[1] = asset_get_index("sp_particle_elemental" + string(action[? "material"]))

	sc_particle_fx_bullet(x + random_range(-4, 4), y + random_range(-4, 4), sprites, 1, 1, 0.5, 1)
}
alarm_set(0, 5)


