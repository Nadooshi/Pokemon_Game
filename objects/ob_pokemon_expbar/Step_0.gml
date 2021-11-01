/// @desc 

//frame = (frame + 1 / (60/8)) mod 4
//tx = sprite_get_texture(sp_for_damage, frame)

_du = (_du - 0.02) mod 1

switch anim {
case 0:  // with earned
	value += actual_value * 0.1
	if value > actual_value  {
		anim_coeff = 0
		anim = 1
		value = actual_value
	}
	break
case 1:  // earned bar
	var _d_coeff = (1-anim_coeff) * 0.1
	anim_coeff += _d_coeff
	if anim_coeff > 0.995  {
		anim_coeff = 1
		anim = -1
	}
	
	var _sw = sw * anim_coeff
	var _wx = lengthdir_x(_sw, image_angle)
	var _wy = lengthdir_y(_sw, image_angle)
	var _u = _sw / sprite_height
	v[2] = [v[0][0] + _wx, v[0][1] + _wy, _u, 0]
	v[3] = [v[1][0] + _wx, v[1][1] + _wy, _u, 1]
	break
case 2:  // no earned bar
	var _d_coeff = (1-anim_coeff) * 0.1
	anim_coeff += _d_coeff
	if anim_coeff > 0.995  {
		anim_coeff = 1
		anim = -1
	}
	value = actual_value * anim_coeff
}
