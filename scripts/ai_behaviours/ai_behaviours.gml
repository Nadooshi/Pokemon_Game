// for ob_player

function sc_ai_idle(){
	timeout--
	if timeout <= 0 {
		timeout = 20 + random(50)
		tgAngle = direction + (90 - random(180))
		scBehaviour = sc_ai_move_idle
		sc_ai_new_target()
	}
}


function sc_ai_move_idle(){
	if maxSpeed > 0
		speed_mod = maxSpeed * -0.5
	if moveSpeed > 0
		moveSpeed = max(0.25, maxSpeed + speed_mod)
	timeout--
	if timeout <= 0 {
		sc_player_stop_set()
		scBehaviour = sc_ai_idle
		timeout = 50 + random(200)
		speed_mod = 0
	} else
		sc_player_move()
	return false
}


function sc_ai_new_target() {
	target = sc_find_nearest_target(id)
	
	if sc_does_exist(target) {
		tgAngle = point_direction(x, y+12, target.x, target.y+12)
		tgX = target.x
		tgY = target.y
		// plan action
		plannedPurpose = sc_choose([_ATTACK_PURPOSE.near, _ATTACK_PURPOSE.far], [1, 1])
		
//		plannedPurpose = choose(_ATTACK_PURPOSE.near, _ATTACK_PURPOSE.far)
		var _attCount = ds_list_size(att_list[plannedPurpose])
		if _attCount > 0 { // hasPurpose
			var _att_num = irandom(_attCount-1)
			plannedActionNum = att_list[plannedPurpose][| _att_num]
		}
		if plannedActionNum < 0 {
			scBehaviour = sc_ai_new_target
			return false
		}
		scBehaviour = sc_ai_follow_target
		last_done = false
	} else 
		plannedActionNum = -1
	
//	scBehaviour = sc_ai_idle
//	timeout = 5 + random(20)
}


function sc_ai_follow_target() {
	if not sc_does_exist(target) {
		scBehaviour = sc_player_stop_set
		return false
	}
	tgAngle = point_direction(x, y+12, target.x, target.y+12)
	tgX = target.x
	tgY = target.y
//	var _target_d = point_distance(x, y+12, target.x, target.y+12)
	// get distance btw collision areas
	var _target_d = distance_to_point(target.x, target.y+12) - 12
	var _neededDist = action_list[| plannedActionNum][? "distance"]
	var _lunge_num = -1
	var _lungeCount = ds_list_size(att_list[_ATTACK_PURPOSE.move])
	if _lungeCount > 0 {  // canLunge
		var _att_num = irandom(_lungeCount-1)
		var _lunge_num = att_list[_ATTACK_PURPOSE.move][| _att_num]

		var _lunge_d =  action_list[| _lunge_num][? "distance"]
	}
	// do Lunge
	if (doActionNum < 0) and
	   (_lunge_num >= 0) and 
	   ((_target_d > _neededDist ) and (_target_d <= _lunge_d)) {
		if action_list[| _lunge_num][? "ap"] <= power_cur {
			doActionNum = _lunge_num
			sc_ai_hit_target()
		} else
			sc_player_move()
		
	} else
	if (doActionNum < 0) and
	   (_target_d <= _neededDist) {
		if plannedActionNum = -1 {
			scBehaviour = sc_ai_new_target
			exit
		}
		sc_ai_hit_target()

	} else {
		// get closer
		sc_player_move()
	}

}

function sc_ai_hit_target() {
	var _done = false
	// do multiple attacks using full power
	doActionNum = plannedActionNum
	if plannedPurpose = _ATTACK_PURPOSE.far
	if collision_line(x, y+12, target.x, target.y+12, ob_hazard, false, false) {
		plannedActionNum = doActionNum
		doActionNum = -1
		// get closer
		// sc_ai_reach
		sc_player_move()
		exit
	}
	if attack_warmup <= 0 {
		event_perform(ev_other, ev_user3) // attack
		_done = sc_ai_wait_warmup_start()
	}
		
	// not enough power
	if (not last_done) and (not _done) {
		// first attempt
		scBehaviour = sc_ai_wait_power
	}
	if last_done and (not _done) {
		// run out of power
		scBehaviour = sc_player_stop_set
		sc_player_stop_set()
		target = noone
	}
		
	last_done = _done	//	false = failed to set warmup (not enough power_cur)1
	
}

function sc_ai_wait_warmup_start() {
	if doActionNum < 0
		return false
		
	if attack_warmup > 0.002 {
		var _neededDist = action_list[| doActionNum][? "distance"]
		var _dirtotg = point_direction(target.x, target.y+12, x, y+12)
		var _newdir = _dirtotg+random(90)-45
		tgX = target.x + cos(_newdir)*_neededDist
		tgY = target.y + sin(_newdir)*_neededDist
		scBehaviour = sc_ai_wait_warmup
	}
	if attack_warmup < 0
		return false
	return true
}


function sc_ai_wait_warmup() {
	if attack_warmup > 0.002 {
		var _d = distance_to_point(tgX, tgY)
		tgAngle = point_direction(x, y+12, tgX, tgY+12)
		if moveSpeed > 0.1  // continue moving
			sc_player_move()
		if _d <= abs(moveSpeed) {
			sc_ai_wait_warmup_start()
		}
	} else {
		tgAngle = point_direction(x, y+12, target.x, target.y+12)
		tgX = target.x
		tgY = target.y
		sc_player_move()
		scBehaviour = sc_player_stop_set
	}
	
}

function sc_ai_wait_power() {
	if not sc_does_exist(target) {
		scBehaviour = sc_player_stop_set
		return false
	}
	sc_player_stop_set()
	// check distance
	var _target_d = distance_to_point(target.x, target.y+12) - 12
	var _neededDist = action_list[| plannedActionNum][? "distance"]
	if _target_d > _neededDist {
		scBehaviour = sc_ai_follow_target
		exit
	}
	sc_ai_hit_target() 
	
}
