/// @desc Waking up 

//var _d = 60 * 0.1 * 3 * 2
var _to_wake = 0
with ob_player {
	if (distance_to_point(other.x, other.y) <= 36 /*_d*/) and
	   (moveSpeed > 0)
	_to_wake ++
}

if _to_wake > 0 {
	show_debug_message(string(id) + " is disturbed by " +string(_to_wake) + " players")
	for (var i=0; i<ds_list_size(states); i++)
	if states[| i].object_index == ob_state_lulling
		states[| i].hit_count -= _to_wake
}

alarm_set(2, 30)
