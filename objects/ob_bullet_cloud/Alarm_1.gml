/// @desc

if ds_exists(action, ds_type_map) {
	var sprites = array_create(2)
	sprites[0] = asset_get_index("sp_particle_elemental" + string(action[? "element"]))
	sprites[1] = asset_get_index("sp_particle_elemental" + string(action[? "material"]))

	sc_particle_fx_pool(x, y, sprites, irandom_range(1, 3), 0.5, 0.5, 1, radius)
}
alarm_set(1, frames_rate * 0.3)


