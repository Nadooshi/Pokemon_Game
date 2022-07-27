/// @desc
radius += 0.2
radius = min(radius, PixPerDist * 1.5)

var _col_list = ds_list_create()
var _n = collision_circle_list(x, y, radius, ob_bullet, false, false, _col_list, false)

for (var i = 0; i < _n; i++) {// blowing of things
		with _col_list[| i]
		if sc_does_exist(action) {
			if action[? "bullet_phys"] = _BULLET_PH.soft {
				x += lengthdir_x(other.wind_power * 1.3, other.wind_dir)
				y += lengthdir_y(other.wind_power * 1.3, other.wind_dir)
			}
		}
}
ds_list_destroy(_col_list)
var _col_list = ds_list_create()
var _n = collision_circle_list(x, y, radius, ob_player, false, false, _col_list, false)

for (var i = 0; i < _n; i++) {
		with _col_list[| i]
		if position_stage = _ATTACK_TG.air {
			x += lengthdir_x(other.wind_power * 0.33, other.wind_dir)
			y += lengthdir_y(other.wind_power * 0.33, other.wind_dir)
			if ds_list_find_index(in_biome, _MATERIAL.wind) = -1
				ds_list_add(in_biome, _MATERIAL.wind)
		}
}
ds_list_destroy(_col_list)
	

part_type_speed(part_leaf_blow, wind_power, wind_power * 1.3, -0.01, -0.1)
part_type_direction(part_leaf_blow, wind_dir - 30, wind_dir + 30, 0, 2)
part_emitter_region(part_system_wind, part_wind_emitter, x - radius, x + radius, y - radius, y + radius, ps_shape_ellipse, ps_distr_gaussian)



if wind_power < 1
	instance_destroy()
