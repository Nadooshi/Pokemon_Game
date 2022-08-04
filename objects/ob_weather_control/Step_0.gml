/// @desc Blowing off

if spawn_emi
	alarm_set(1, frames_rate * random(2))

wind_dir += wind_d_dir
wind_d_dir *= 0.94
var mx_l = lengthdir_x(max_wind_power, 0)
var mod_dir = 45 * (lengthdir_x(wind_power, wind_dir) / mx_l)
	
// blowing off
with ob_emitter_weather {
	if part_type_exists(part_rain) {
		part_type_direction(part_rain, 265 + mod_dir, 275 + mod_dir, 0, 0)
	}

	if part_type_exists(part_snow) {
		part_type_direction(part_snow, 240 + mod_dir, 300 + mod_dir, 0, 0)
		part_type_speed(part_snow, 0.2 + other.wind_power, 2 + other.wind_power, 0, 0)
	}
	
	if part_type_exists(part_smoke) {
		part_type_direction(part_smoke, other.wind_dir, other.wind_dir, 0, 0)
		part_type_speed(part_smoke, 0.3 + other.wind_power, 2 + other.wind_power, 0, 0)
	}
}

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

with ob_wind_emitter {
	wind_power = other.wind_power
	wind_dir = other.wind_dir
	x += lengthdir_x(other.wind_power, other.wind_dir)
	y += lengthdir_y(other.wind_power, other.wind_dir)
}

//=============================================================================================


