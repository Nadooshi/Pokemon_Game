/// @desc Stick ob_collide to object

var _x = x + hspeed
var _y = y + vspeed

var _k = ds_map_find_first(coll_areas)
while not is_undefined(_k) {
	with coll_areas[? _k] {
		x = _x
		y = _y
	}
	_k = ds_map_find_next(coll_areas, _k)
}

bouncing = false
