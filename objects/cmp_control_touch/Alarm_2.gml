/// @desc Update target

//sc_find_nearest_target(id, _ATTACK_AFFECT.enemy | _ATTACK_AFFECT.friend)
#macro AUTOTARGET_MAX_DISTANCE 100

var _adiff = 0
var _min_adiff = 90
var _closest_id = noone

with ob_player 
if id != other.id
if point_distance(other.x, other.y + 12, x, y + 12) < AUTOTARGET_MAX_DISTANCE {
	_adiff = abs(angle_difference(other.direction, point_direction(other.x, other.y, x, y)))
	if _adiff < _min_adiff {
		_closest_id = id
	}
}

if sc_does_exist(_closest_id) {
	with ob_cursor{
		event_perform(ev_other, ev_user0) // update ob_cursor
		x = _closest_id.x
		y = _closest_id.y + 12
	}
} else {
//	ob_cursor.visible = false
	ob_cursor.x = x + lengthdir_x(AUTOTARGET_MAX_DISTANCE, direction)
	ob_cursor.y = y + lengthdir_y(AUTOTARGET_MAX_DISTANCE, direction)
}

alarm_set(2, AUTOTARGET_PERIOD)
