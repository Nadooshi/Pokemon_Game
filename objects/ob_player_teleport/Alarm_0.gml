/// @desc ai_teleport_process

if collision_line(x, y+_z, tg_x, tg_y, ob_hazard, false, true) {
	
	var _dirtotg = point_direction(tg_x, tg_y, x, y+_z)
	var _d = point_distance(tg_x, tg_y, x, y+_z)
	var _ok = false
	repeat (10) {
		var _newdir = _dirtotg+(random(90)-45)
		tg_x = tg_x + cos(degtorad(_newdir))*_d
		tg_y = tg_y + sin(degtorad(_newdir))*_d
		_ok = not position_meeting(tg_x, tg_y, ob_collision_area)
		if _ok break
	}
} else {
	x = tg_x
	y = tg_y - _z
	event_perform(ev_other, ev_user1)
	exit
}

alarm_set(0, 60)
