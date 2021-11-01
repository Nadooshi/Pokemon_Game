/// @desc

if not is_undefined(map)
if ds_exists(map, ds_type_map) {
	max_value = map[? "nextlvl_exp"]
	value = min(map[? parameter_name], max_value)
	if is_undefined(map[? "prev_exp"])
		map[? "prev_exp"] = value
	prev_exp = min(map[? "prev_exp"], max_value)
	earned = max(value - prev_exp, 0)
	
	hint = "exp: "	  + string(value) + 
		"\n earned: " +	string(earned) +
		"\n max: "	  + string(max_value)
	
	actual_value = value
	value = 0
	
	// update draw values
	var _x = x + lengthdir_x(sprite_width * (prev_exp / max_value), image_angle)
	var _y = y + lengthdir_y(sprite_width * (prev_exp / max_value), image_angle)

	sw = sprite_width * (earned / max_value)
	var _wx = 0 //lengthdir_x(sw, image_angle)
	var _wy = 0 //lengthdir_y(sw, image_angle)
	var _hx = lengthdir_x(sprite_height, image_angle - 90)
	var _hy = lengthdir_y(sprite_height, image_angle - 90)

	var _u = sw / sprite_height

	v[0] = [_x,	_y,						   0, 0]
	v[1] = [_x + _hx,	   _y + _hy,	   0, 1]
	v[2] = [_x + _wx,  	   _y + _wy,	  _u, 0]
	v[3] = [v[2][0] + _hx, v[2][1] + _hy, _u, 1]
	
//	v[3] = [_x + _wx + _hx, _y + _wy + _hy, _u, 1]

	if earned > 0 {
		anim = 0  // with earned
		actual_value = prev_exp
	} else
		anim = 2 // no earned bar
		
	anim_coeff = 0
}
