/// @desc 

if not selected
	exit

if not canMove
	exit

if not instance_exists(ob_control_touch_stick)
	exit

//array_copy(keys_before, 0, keys, 0, array_length(keys))

var newangle = ob_control_touch_stick.direction

//tgAngle = newangle

tgX = ob_cursor.x
tgY = ob_cursor.y

// detect changes in control direction
if not doMove {
	if ob_control_touch_stick.dir_is_set > 0	{
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

// do attacks
var ok = false
for (i=0; i<6; i++)
if keys[i+k.action1] {
	if doActionNum = -1 {
		var _a_map = action_list[| i]
		if not is_undefined(_a_map) {
			target = ob_cursor
			ok = true
			doActionNum = i
			event_perform(ev_other, ev_user3)
		}
	}
	break;
}

// bury
if canMove {
	if keys[k.Bury] and not keys_before[k.Bury]
		event_perform(ev_other, ev_user2)
	if keys[k.Fly ] and not keys_before[k.Fly ]
		event_perform(ev_other, ev_user4)
}

// suicide
if keys[k.Suicide]
	sc_hurt(health_cur + 1, id, undefined)


