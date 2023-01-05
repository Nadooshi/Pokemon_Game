/// @desc

	
var _k = ds_map_find_first(coll_areas)
while not is_undefined(_k) {
	with coll_areas[? _k] {
		x = other.x + other.hspeed
		y = other.y + other.vspeed
	}
	_k = ds_map_find_next(coll_areas, _k)
}
