/// @desc
event_inherited();

timeout--
if timeout<=0 {
	instance_destroy()
	exit
}

with pokemon_id_attack {
	sc_player_stop_set()
	canMove = false
	speed = 0
}

phi = pi * (1 - timeout/init_timeout)
_z = 12 + sin(phi) * upgea

with pokemon_id {
	canMove = false
	tgAngle = -other.attract_dir
	speed = 0
	
	x += lengthdir_x(other.attract_speed, -tgAngle)
	y += lengthdir_y(other.attract_speed, -tgAngle)
	_z = other._z
}

