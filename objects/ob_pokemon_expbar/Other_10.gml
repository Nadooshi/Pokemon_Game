/// @desc

if not is_undefined(map)
if ds_exists(map, ds_type_map) {
	max_value = map[? "nextlvl_exp"]
	value = min(map[? "exp"], max_value)
	prev_exp = min(map[? "prev_exp"], max_value)
	hint = string(value) + "\n" + string(value - prev_exp)
	
	// update draw values
	var _x = x + lengthdir_x(sprite_width * (prev_exp / max_value), image_angle)
	var _y = y + lengthdir_y(sprite_width * (prev_exp / max_value), image_angle)

	var _sw = sprite_width * ((value-prev_exp) / max_value)
	var _wx = lengthdir_x(_sw, image_angle)
	var _wy = lengthdir_y(_sw, image_angle)
	var _hx = lengthdir_x(sprite_height, image_angle - 90)
	var _hy = lengthdir_y(sprite_height, image_angle - 90)

	var _u = _sw / sprite_height

	v[0] = [_x,	_y,							 0, 0]
	v[1] = [_x + _hx, _y + _hy,				 0, 1]
	v[2] = [_x + _wx, _y + _wy,				_u, 0]
	v[3] = [_x + _wx + _hx, _y + _wy + _hy, _u, 1]
	
}
