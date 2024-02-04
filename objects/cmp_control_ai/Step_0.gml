/// @desc 

if not canMove
	exit

prev_doMove = doMove

if script_exists(scBehaviour) or is_method(scBehaviour) {
	if scBehaviour = sc_player_stop_set {
		if sc_does_exist(target, undefined, "'target' in Step")
			sc_set_behaviour(sc_ai_follow_target)
		else
			sc_set_behaviour(sc_ai_idle)
	}
}

if not sc_does_exist(target, undefined, "'target' in Step") {
	plannedActionNum = -1
//	sc_set_move_component(cmp_moving)
}

if courage_cur < courage_threshold
	sc_ai_set_flee()

