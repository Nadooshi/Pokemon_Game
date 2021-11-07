function sc_map_floor_all_reals(_map) {
	var _k = ds_map_find_first(_map)
	while not is_undefined(_k) {
		if ds_map_is_map(_map, _k) {
			sc_map_floor_all_reals(_map[? _k])
			_k = ds_map_find_next(_map, _k)
			continue
		} else
		if ds_map_is_list(_map, _k) {
			sc_list_floor_all_reals(_map[? _k])
			_k = ds_map_find_next(_map, _k)
			continue
		}
		
		if is_real(_map[? _k])
			_map[? _k] = floor(_map[? _k])
			
		_k = ds_map_find_next(_map, _k)
	}
	
}

function sc_list_floor_all_reals(_list) {
	var _sz = ds_list_size(_list)
	for (var i=0; i<_sz; i++) {
		if ds_list_is_list(_list, i) {
			sc_list_floor_all_reals(_list[| i])
			continue
		} else 
		if ds_list_is_map(_list, i) {
			sc_map_floor_all_reals(_list[| i])
			continue
		}
		
		if is_real(_list[| i])
			_list[| i] = floor(_list[| i])
	}
}
