/// @arg string
function sc_remove_hashtag(argument0) {

	var _s = argument0
	if is_undefined(_s) {
		show_message("Something wrong!")
		_s = "Wrong this!"
		return _s
	}
	var _n = (string_pos("#", _s) == 0) ? string_length(_s) : string_pos("#", _s)-1
	return string_copy(_s, 1, _n)
}


