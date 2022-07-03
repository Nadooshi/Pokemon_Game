/// @desc 

if not selected
	exit

if not canMove
	exit

array_copy(keys_before, 0, keys, 0, array_length(keys))

for (var i=0; i<k._count; i++) 
switch (keyCodes[i, 1]) {
	case 0:
		keys[i] = keyboard_check(keyCodes[i, 0])
		break
	case 1:
		keys[i] = mouse_check_button(keyCodes[i, 0])
		break
}

var newangle = 0
var dcount = 0
if keys[k.Left ] { newangle += dirangle[d.Left ]; dcount++ }
if keys[k.Right] { newangle += dirangle[d.Right]; dcount++; if keys[k.Down] newangle += 360 }
if keys[k.Up   ] { newangle += dirangle[d.Up   ]; dcount++ }
if keys[k.Down ] { newangle += dirangle[d.Down ]; dcount++ }
if dcount>0	newangle = newangle / dcount

ob_cursor.x = mouse_x
ob_cursor.y = mouse_y

tgX = ob_cursor.x
tgY = ob_cursor.y

// detect changes in control direction
if not doMove {
	if dcount > 0	{
		direction = newangle
		tgAngle = direction
		sc_set_behaviour(sc_player_move_set)
	}
} else {
	if dcount > 0
		tgAngle = newangle
	else
		sc_set_behaviour(sc_player_stop_set)
}
doMove = (dcount > 0)

// do attacks
var ok = false
for (i=0; i<6; i++)
if keys[i+k.action1] {
	if doActionNum = -1 {
		var _a_map = action_list[| i]
		if not is_undefined(_a_map)
		if _a_map[? "cooldown"] <= 0 {
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

// escape trap
if keys[k.breakfree]
	sc_break_state_trap()
	