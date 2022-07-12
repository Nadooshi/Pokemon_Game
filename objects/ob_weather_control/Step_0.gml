/// @desc Blowing off

wind_dir += wind_d_dir
wind_d_dir *= 0.94// 0.1//0.95

// blowing off
with ob_bullet 
if sc_does_exist(action) {
	if action[? "bullet_phys"] = _BULLET_PH.soft {
		x += lengthdir_x(other.wind_power, other.wind_dir)
		y += lengthdir_y(other.wind_power, other.wind_dir)
	}
}

with ob_player
if position_stage = _ATTACK_TG.air {
	x += lengthdir_x(other.wind_power * 0.25, other.wind_dir)
	y += lengthdir_y(other.wind_power * 0.25, other.wind_dir)
}
