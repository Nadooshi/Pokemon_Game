/// @desc apply aura

if array_length(aura) <= 0
	exit

var _s = array_length(aura)
var _p_obj = ds_list_create()
var _sz = collision_circle_list(x, y, 3 * PixPerDist, ob_player, false, false, _p_obj, false)

for (var i = 0; i < _s; i++) // прогон по array[aura]
for (var p = 0; p < _sz; p++) 
	if aura[i] != _ELEMENTAL.none
		with _p_obj[| p]
		if ds_list_find_index(in_biome, other.aura[i]) = -1
			ds_list_add(in_biome, other.aura[i])

alarm_set(2, 30)

ds_list_destroy(_p_obj)

