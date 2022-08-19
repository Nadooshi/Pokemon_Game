function sc_particle_fx_pool(x, y, sprite, number, life_time, size_min, size_max, radius){
	/// @arg x
	/// @arg y
	/// @arg sprites[array]
	/// @arg number[integer]
	/// @arg lifetime[real]
	/// @arg sizeMin[real]
	/// @arg sizeMax[real]
	/// @arg radius[real]

if is_undefined(life_time)
	life_time = 0.5
life_time = max(life_time, 0.5)
if is_undefined(number)
	number = 1
if is_undefined(size_min)
	size_min = 1
if is_undefined(size_max)
	size_max = 1
if is_undefined(radius)
	radius = 8

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
part_type_speed(fx_bullet, 0, 0, 0, 0)
part_type_life(fx_bullet, frames_rate * 0.5, frames_rate * life_time)
part_type_alpha3(fx_bullet, 0, 1, 0)
part_type_size(fx_bullet, size_min, size_max, 0, 0)
//==================================================================================
#endregion

var sp_choose = noone

repeat (number) {
	var _r = random(radius) - radius * 0.5
	var _a = random(360)
	var _x, _y;
	_x = lengthdir_x(_r, _a)
	_y = lengthdir_y(_r, _a)
	sp_choose = sprite[irandom(_n)]
	part_type_sprite(fx_bullet, sp_choose, false, false, false)
	part_particles_create(fx_system_damage,x + _x, y + _y, fx_bullet, 1)
}
return true
}