/// @desc 

if not canMove
	exit

prev_doMove = doMove

if script_exists(scBehaviour) or is_method(scBehaviour) {
	if scBehaviour = sc_player_stop_set {
		if sc_does_exist(target)
			sc_set_behaviour(sc_ai_follow_target)
		else
			sc_set_behaviour(sc_ai_idle)
	}

}

//var _a_map = action_list[| plannedActionNum]
//if not is_undefined(_a_map)
//if _a_map[? "ap"] > power_cur {
//	target = noone
//}

if not sc_does_exist(target)
	plannedActionNum = -1
