function sc_average_point(_arr) {
	// get average point between instances
	var _avg = []
	_avg[0] = 0
	_avg[1] = 0
	var _c = array_length(_arr)
	for (var i=0; i<_c; i++) {
		_avg[0] += _arr[i].x
		_avg[1] += _arr[i].y
	}
	_avg[0] = _avg[0] / _c
	_avg[1] = _avg[1] / _c
	return _avg
}

