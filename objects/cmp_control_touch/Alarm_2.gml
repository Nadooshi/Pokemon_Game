/// @desc Update target

//sc_find_nearest_target(id, _ATTACK_AFFECT.enemy | _ATTACK_AFFECT.friend)
#macro AUTOTARGET_MAX_DISTANCE 180

var _adiff = 0
var _min_adiff = 45
var _closest_id = noone
var _tgList = []   // array of points + instance_id    // [points, pokemon_id]
var _d
var _points
with ob_player 
if id != other.id {
	_d = point_distance(other.x, other.y + 12, x, y + 12)
	_adiff = abs(angle_difference(other.direction, point_direction(other.x, other.y, x, y)))
	if _d < AUTOTARGET_MAX_DISTANCE
	if _adiff <= _min_adiff {
		_points = (1 -_adiff / _min_adiff) + (1 -_d / AUTOTARGET_MAX_DISTANCE) * 2
		_points = floor(_points * 100)*1000000 + id
		array_push(_tgList, _points)
	}
}

if array_length(_tgList) > 0 {
	array_sort(_tgList, false)
	_closest_id = floor(_tgList[0] - floor(_tgList[0] / 1000000)*1000000)
}

if sc_does_exist(_closest_id) {
	autotarget_found = true
	with ob_cursor{
		event_perform(ev_other, ev_user0) // update ob_cursor
		x = _closest_id.x
		y = _closest_id.y + 12
	}
} else {
	autotarget_found = false
}

alarm_set(2, AUTOTARGET_PERIOD)
