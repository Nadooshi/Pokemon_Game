function sc_particle_fx_bullet(x, y, sprite, number, life_time, size_min, size_max){
	/// @arg x
	/// @arg y
	/// @arg sprites[array]
	/// @arg number[integer]
	/// @arg lifetime[real]
	/// @arg sizeMin[real]
	/// @arg sizeMax[real]

if is_undefined(life_time)
	life_time = 0.5
life_time = max(life_time, 0.5)
if is_undefined(number)
	number = 1
if is_undefined(size_min)
	size_min = 1
if is_undefined(size_max)
	size_max = 1

var _n = array_length(sprite) - 1
array_sort(sprite, false)
do {
	if sprite[_n] < 0 {
		array_pop(sprite)
		_n--
		if _n < 0
			return false
	}
}
until sprite[_n] >= 0

#region particle setup
//==================================================================================
var fx_bullet = part_type_create()
part_type_speed(fx_bullet, 0.5, 1, -0.05, 0.03)
part_type_life(fx_bullet, frames_rate * 0.5, frames_rate * life_time)
part_type_alpha2(fx_bullet, 1, 0)
part_type_direction(fx_bullet, 260, 280, 0, 10)
part_type_size(fx_bullet, size_min, size_max, 0, 0)
//==================================================================================
#endregion

var sp_choose = noone

repeat (number) {
	sp_choose = sprite[irandom(_n)]
	part_type_sprite(fx_bullet, sp_choose, false, false, false)
	part_particles_create(fx_system_damage,x + random_range(-4, 4), y + random_range(-4, 4), fx_bullet, 1)
}
return true
}