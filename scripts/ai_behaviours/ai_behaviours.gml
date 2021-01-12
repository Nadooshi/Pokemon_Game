// for ob_player

function sc_ai_idle(){
	timeout--
	if timeout <= 0 {
		timeout = 10 + random(25)
		tgAngle = direction + (90 - random(180))
		scBehaviour = sc_ai_move_idle
	}
}


function sc_ai_move_idle(){
	speed_mod = -0.5
	timeout--
	if timeout <= 0 {
		sc_player_stop_set()
		scBehaviour = sc_ai_idle
		timeout = 100 + random(250)
	} else
		sc_player_move()
	return false
}


function sc_ai_new_target() {
	target = sc_find_nearest_target(id)
	
	if sc_does_exist(target) {
		tgAngle = point_direction(x, y, target.x, target.y)
		// plan action
		plannedPurpose = choose(_ATTACK_PURPOSE.near, _ATTACK_PURPOSE.far)
		var _attCount = ds_list_size(att_list[plannedPurpose])
		if _attCount > 0 { // hasPurpose
			var _att_num = irandom(_attCount-1)
			plannedActionNum = att_list[plannedPurpose][| _att_num]
		}
		if plannedActionNum < 0
			return false
	
		var _a_map = action_list[| plannedActionNum]
		neededDist = (_a_map[? "range"] * 18) - 32  // 60 * 0.1 * moveSpeed (3)
		neededDist = max(32, neededDist)
		scBehaviour = sc_ai_follow_target
		//tgX = target.x
		//tgY = target.y
		
	}
//	scBehaviour = sc_ai_idle
//	timeout = 5 + random(20)
}

function sc_ai_follow_target() {
	var _target_d = distance_to_point(target.x, target.y)
	var _lunge_d = 0
	var _lunge_num = -1
	var _lungeCount = ds_list_size(att_list[_ATTACK_PURPOSE.move])
	if _lungeCount > 0 {  // canLunge
		var _att_num = irandom(_lungeCount-1)
		var _lunge_num = att_list[_ATTACK_PURPOSE.move][| _att_num]

		var _lunge_map = action_list[| _lunge_num]
		_lunge_d = (pokemon_map[? "ap"] * 0.66) * _lunge_map[? "range"] * 6
	}
	// do Lunge
	if (_target_d > maxSpeed * 60) and// canCoverDist in 1 second
	   (_target_d <= _lunge_d) and
	   (_lunge_num != -1) {
		doActionNum = _lunge_num
		event_perform(ev_other, ev_user3) // attack
	} else
	if _target_d < neededDist {
		// do multiple attacks using full power
		doActionNum = plannedActionNum
		event_perform(ev_other, ev_user3) // attack
	} else {
		// get closer
		sc_player_move()
	}


}
