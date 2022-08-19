function sc_particle_fx_explode(x, y, sprite, number, life_time, size_min, size_max){
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
var fx_explode = part_type_create()
part_type_orientation(fx_explode, 0, 359, 0, 0, true)
part_type_speed(fx_explode, 1, 2, -0.1, 0)
part_type_life(fx_explode, frames_rate * 0.5, frames_rate * life_time)
part_type_alpha3(fx_explode, 0, 1, 0.5)
part_type_direction(fx_explode, 0, 359, 0, 10)
part_type_size(fx_explode, size_min, size_max, 0, 0)
part_type_gravity(fx_explode, 0.05, 270)
//==================================================================================
#endregion

var sp_choose = noone

repeat (number) {
	sp_choose = sprite[irandom(_n)]
	part_type_sprite(fx_explode, sp_choose, false, false, false)
	part_particles_create(fx_system_damage,x,y, fx_explode, 1)
}
return true
}