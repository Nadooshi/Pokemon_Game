function sc_choose(variant_arr, rates_arr) {
	var _vcount = array_length(variant_arr)
	if _vcount != array_length(rates_arr)
		return false
		
	// sum rates
	var _rsum = 0
	for (var i=0; i<_vcount; i++)
		_rsum+=rates_arr[i]

	var _range = 0
	var _r = random(_rsum)
	for (var i=0; i<_vcount; i++) {
		if _r>_range and _r<=_range+rates_arr[i]
			return variant_arr[i]
		_range+=rates_arr[i]
	}
}
