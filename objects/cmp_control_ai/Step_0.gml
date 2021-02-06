/// @desc 
counter++

if not canMove
	exit

prev_doMove = doMove

if script_exists(scBehaviour) or is_method(scBehaviour) {
	if scBehaviour = sc_player_stop_set {
		if sc_does_exist(target)
			scBehaviour = sc_ai_follow_target
		else
			scBehaviour = sc_ai_idle
	}

	if scBehaviour != prev_behaviour
		show_debug_message("AI: behaviour changed to " + script_get_name(scBehaviour) + "(" + string(scBehaviour) + ")")
	prev_behaviour = scBehaviour
}

var _a_map = action_list[| plannedActionNum]
if not is_undefined(_a_map)
if _a_map[? "ap"] > power_cur {
	target = noone
	
}

if not sc_does_exist(target)
	plannedActionNum = -1
