function sc_element_coeff(_element, _tg_element) {
	var _table_entry = (_tg_element != _ELEMENTAL.none) ? element_table[_tg_element] : -1 
	
	var _coeff = 1
	if array_length(_table_entry)=3 {
		_coeff *= (_table_entry[0] == _element) ? 0.5 : 1
		_coeff *= (_table_entry[1] == _element) ? 2 : 1
		_coeff *= (_table_entry[2] == _element) ? 2 : 1
	}
	return _coeff
}
