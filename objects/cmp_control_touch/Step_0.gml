/// @desc 

if not selected
	exit

if not canMove
	exit

if not instance_exists(ob_control_touch_stick)
	exit

var newangle = ob_control_touch_stick.direction

tgX = ob_cursor.x
tgY = ob_cursor.y

// detect changes in control direction
if not doMove {
	if ob_control_touch_stick.dir_is_set > 0 {
		direction = newangle
		tgAngle = direction
		sc_set_behaviour(sc_player_move_set)
	}
} else {
	if ob_control_touch_stick.dir_is_set> 0
		tgAngle = newangle
	else
		sc_set_behaviour(sc_player_stop_set)
}
doMove = (ob_control_touch_stick.dir_is_set > 0)

//if alarm[2] = -1
//	alarm_set(2, AUTOTARGET_PERIOD)

// ! no keys for these!

//// bury
//if canMove {
//	if keys[k.Bury] and not keys_before[k.Bury]
//		event_perform(ev_other, ev_user2)
//	if keys[k.Fly ] and not keys_before[k.Fly ]
//		event_perform(ev_other, ev_user4)
//}

//// suicide
//if keys[k.Suicide]
//	sc_hurt(health_cur + 1, id, undefined)

if not autotarget_found 
with ob_cursor {
	x = other.x + lengthdir_x(AUTOTARGET_MAX_DISTANCE, other.direction)
	y = other.y + lengthdir_y(AUTOTARGET_MAX_DISTANCE, other.direction)
	event_perform(ev_other, ev_user0) // update ob_cursor
}
	


