function forall_in_list(_list, _func, _parameter) {
	var _sz = ds_list_size(_list)
	for (var i=0; i<_sz; i++) 
		_func(_list[| i], i, _parameter)
}
