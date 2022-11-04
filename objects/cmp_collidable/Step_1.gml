/// @desc

	
var _k = ds_map_find_first(coll_areas)
while not is_undefined(_k) {
	with coll_areas[? _k] {
		coll_area.x = x + hspeed
		coll_area.y = y + vspeed + 12
	}
	_k = ds_map_find_next(coll_areas, _k)
}
