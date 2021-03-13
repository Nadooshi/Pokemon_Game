/// @desc 

// Inherit the parent event
event_inherited();

ds_map_destroy(h_marks)
var _hm = ds_map_find_first(h_marks)
while not is_undefined(_hm) {
	ds_map_destroy(_hm)	
	_hm = ds_map_find_next(h_marks, _hm)
}

