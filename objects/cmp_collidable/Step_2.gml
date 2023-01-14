/// @desc Stick object to ob_collide

var _k = ds_map_find_first(coll_areas)
while not is_undefined(_k) {
	with coll_areas[? _k] {
		other.x = x
		other.y = y
		_k = undefined
	}
	_k = ds_map_find_next(coll_areas, _k)
}

