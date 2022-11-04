/// @desc

//if instance_exists(coll_area)
//instance_destroy(coll_area)
//coll_area = noone	

var _k = ds_map_find_first(coll_areas)
while not is_undefined(_k) {
	instance_destroy(coll_areas[? _k])
	_k = ds_map_find_next(coll_areas, _k)
}
