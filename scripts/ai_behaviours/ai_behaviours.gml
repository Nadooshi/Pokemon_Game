// for ob_player

function sc_ai_wastetime(){
	sc_player_stop_set()
	timeout--
	if timeout <= 0 {
		timeout = 20 + random(50)
		tgAngle = direction + (90 - random(180))
		sc_set_behaviour(sc_ai_move_idle)
	}
}

function sc_ai_idle(){
	sc_player_stop_set()
	timeout--
	if timeout <= 0 {
		timeout = 20 + random(50)
		tgAngle = direction + (90 - random(180))
		sc_set_behaviour(sc_ai_move_idle)
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
		sc_set_behaviour(sc_ai_idle)
		timeout = 50 + random(200)
		speed_mod = 0
	} else
		sc_player_move()
	return false
}

function sc_ai_new_target() {
	// plan action
	plannedPurpose = sc_choose(
		[_ATTACK_PURPOSE.near,
		_ATTACK_PURPOSE.far,
		_ATTACK_PURPOSE.area,
		_ATTACK_PURPOSE.barrier],
		[1, 1, 1, 1]
	)
	
	var _attCount = ds_list_size(att_list[plannedPurpose])
	if _attCount > 0 { // hasPurpose
		var _att_num = irandom(_attCount-1)
		plannedActionNum = att_list[plannedPurpose][| _att_num]
		// check position stage
		if ds_list_find_index(att_tgFroms[position_stage], plannedActionNum) = -1 {
			// new attack
			target = noone
			plannedActionNum = -1
		}
	}
	if plannedActionNum < 0 {
		// new attack
		sc_set_behaviour(sc_ai_new_target)
		return false
	}
	// find target
	var _action = action_list[| plannedActionNum]
	var _a = [_ATTACK_AFFECT.enemy, _ATTACK_AFFECT.friend]
	var _affect = _a[_action[? "role"]] & _action[? "affect"]
	target = sc_find_nearest_target(id, _affect, infinity, _action[? "tgTo"])
	
	if sc_does_exist(target) {
//		sc_logging_state_over(id, "decided to use " + _action[? "name"] + " as " + attack_affect_text[_affect])
		tgAngle = point_direction(x, y+12, target.x, target.y+12)
		tgX = target.x
		tgY = target.y
		sc_set_behaviour(sc_ai_follow_target)
		switch plannedPurpose {
		case _ATTACK_PURPOSE.near:
		case _ATTACK_PURPOSE.far:
			sc_set_behaviour(sc_ai_follow_target)
			break
		case _ATTACK_PURPOSE.area:
			sc_set_behaviour(sc_ai_target_group)
			break
		case _ATTACK_PURPOSE.barrier:
			sc_set_behaviour(sc_set_barrier_target)
			break
		}
	} else if (_action[? "role"] = _ATTACK_ROLE.buff) and (_action[? "affect"] = _ATTACK_AFFECT.itself) {
		// buff hits itself
//		sc_logging_state_over(id, "decided to use " + _action[? "name"] + " as \"buff\" to \"itself\"" )
		target = id
		sc_set_behaviour(sc_ai_hit_target)
	} else {
		// no targets suitable to action
		plannedActionNum = -1
		fail_count++
		if fail_count>=max_fails {
//			sc_logging_state_over(id, " didn't find any useful attack " + string(max_fails) + " times and")
			fail_count = 0
			sc_set_behaviour(sc_ai_set_flee)
		}
	}
}

function sc_ai_follow_target() {
	if not sc_does_exist(target) {
		sc_player_stop_set()
		sc_set_behaviour(sc_player_stop_set)
		return false
	}
	if plannedActionNum = -1 {
		sc_set_behaviour(sc_ai_new_target)
		exit
	}
	tgAngle = point_direction(x, y, target.x, target.y)
	tgX = target.x
	tgY = target.y
	// get distance btw collision areas
	var _target_d = point_distance(x, y+12, target.x, target.y+12)-12 // -12 for far attack reach
	var _neededDist = action_list[| plannedActionNum][? "distance"]
	var _lunge_num = -1
	var _lungeCount = ds_list_size(att_list[_ATTACK_PURPOSE.move])
	if _lungeCount > 0 {  // canLunge
		var _att_num = irandom(_lungeCount-1)
		var _lunge_num = att_list[_ATTACK_PURPOSE.move][| _att_num]
		var _lunge_d =  action_list[| _lunge_num][? "distance"]
		if ds_list_find_index(att_tgFroms[position_stage], _lunge_num) = -1
			_lunge_num = -1
	}
	// do Lunge
	if (doActionNum < 0) and
	   (_lunge_num >= 0) and 
	   ((_target_d > _neededDist ) and (_target_d <= _lunge_d)) {
		if action_list[| _lunge_num][? "ap"] <= power_cur {
			plannedActionNum = _lunge_num
			sc_set_behaviour(sc_ai_hit_target)
		} else {
			sc_check_reaching_target()
			sc_player_move()
		}
		
	} else
	if (doActionNum < 0) and
	   (_target_d <= _neededDist) {
		sc_set_behaviour(sc_ai_hit_target)

	} else {
		// get closer
		sc_check_reaching_target()
		sc_player_move()
	}
}

function sc_ai_target_group() {
	if not sc_does_exist(target) {
		sc_player_stop_set()
		sc_set_behaviour(sc_player_stop_set)
		return false
	}
	
	if counter mod 20 = 0 {
		var _neededDist = 6
		switch action_list[| plannedActionNum][? "type"] {
		case _ATTACK_TYPE.aura: 
			_neededDist = action_list[| plannedActionNum][? "distance"]
			break
		case _ATTACK_TYPE.pool: 
			_neededDist = (action_list[| plannedActionNum][? "radius"] + 1) * 8
			break
		}
		
	// update groups
		ds_map_clear(ai_groups)
		var _self = id
		with ob_player
		if not is_like(id, ob_barrier)
		if id != _self.id {
			_self.ai_groups[? id] = [id]
			with ob_player
			if not is_like(id, ob_barrier)
			if (id != other.id) and (id != _self.id)
			if distance_to_point(other.x, other.y) <= _neededDist * 2 
				array_push(_self.ai_groups[? other.id], id)
		}
		
		// choose biggest group
		var _bGroup = noone // player id with biggest g
		var _bCount = 1
		var _id = ds_map_find_first(ai_groups)
		while not is_undefined(_id) {
			var _groupCount = array_length(ai_groups[? _id])
			if _groupCount > _bCount
				_bGroup = _id
			_id = ds_map_find_next(ai_groups, _id)
		}
		if _bGroup != noone {
			var _avg = sc_average_point(ai_groups[? _bGroup])
			//with instance_create_layer(_avg[0], _avg[1], "Particles", ob_particle) {
			//	radius = _neededDist
			//	alpha = 0.25
			//	d_alpha = -0.01
			//}
			target = instance_create_layer(_avg[0], _avg[1], "Game", ob_fake_target)
			target.parent = id
			target.group = ai_groups[? _bGroup]
			
			// get to the point and attack
			tgAngle = point_direction(x, y+12, target.x, target.y+12)
			tgX = target.x
			tgY = target.y
			tgDelta = 20
		} else {
			// try another attack
			sc_player_stop_set()
			sc_set_behaviour(sc_player_stop_set)
			exit
		}
	}
	
	if sc_ai_get_to_point() {
		sc_set_behaviour(sc_ai_hit_target)
	}
}

function sc_ai_get_to_point() {
	var _d = point_distance(x, y+12, tgX, tgY+12)
//	tgAngle = point_direction(x, y+12, tgX, tgY+12)
	sc_check_reaching_target()	
	sc_player_move()
	if _d <= max(abs(moveSpeed) * 0.75, tgDelta) {
		tgDelta = 0
		return true
	}
	return false
}

function sc_ai_hit_target() {
	if not sc_does_exist(target) {
		sc_player_stop_set()
		sc_set_behaviour(sc_player_stop_set)
		sc_set_move_component(cmp_moving)
		return false
	}
	
	// don't repeat buff
	if lastActionNum >= 0 {
		if action_list[| lastActionNum][? "role"] = _ATTACK_ROLE.buff {
			sc_ai_give_up()
			lastActionNum = -1
			return false
		}
		if action_list[| lastActionNum][? "damage"] = 0 {
			sc_ai_give_up()
			lastActionNum = -1
			return false
		}
	}
	
	
	var _done = false
	// do multiple attacks using full power
	doActionNum = plannedActionNum
	if plannedPurpose = _ATTACK_PURPOSE.far {
		if sc_check_reaching_target() == false {
			plannedActionNum = doActionNum
			doActionNum = -1
			sc_player_move()
			exit
		}
		tgAngle = point_direction(x, y+12, target.x, target.y+12)
		tgX = target.x
		tgY = target.y
	}

	
	
	if attack_warmup <= 0 {
		tgAngle = point_direction(x, y+12, target.x, target.y+12)
		tgX = target.x
		tgY = target.y
		event_perform(ev_other, ev_user3) // attack (start warmup)
		_done = (attack_error = _ATTACK_ERROR.nothing)
		if _done
			sc_ai_wait_warmup_start()
	}
	
	if attack_error = _ATTACK_ERROR.no_power {
		if (not last_done) and (not _done) 
			// first attempt
			sc_set_behaviour(sc_ai_wait_power)
		if last_done and (not _done) {
			// run out of power
			sc_ai_give_up()
		}
	}
	last_done = _done	//	false = failed to set warmup (not enough power_cur)
	
}

function sc_ai_give_up() {
	sc_set_behaviour(sc_player_stop_set)
	sc_player_stop_set()
	plannedActionNum = -1
	doActionNum = -1
	target = noone
}

function sc_ai_wait_warmup_start() {
	if doActionNum < 0
		return false
		
	if attack_warmup > 0.002 {
		var _neededDist = action_list[| doActionNum][? "distance"]
		var _dirtotg = point_direction(target.x, target.y+12, x, y+12)
		var _ok = false
		repeat (10) {
			var _newdir = _dirtotg+(random(90)-45)
			tgX = target.x + cos(degtorad(_newdir))*_neededDist
			tgY = target.y + sin(degtorad(_newdir))*_neededDist
			_ok = not position_meeting(tgX, tgY, ob_collision_area)
			if _ok break
		}
		if not _ok	
//			show_message("Failed to find a place for sc_ai_wait_warmup")
		sc_set_behaviour(sc_ai_wait_warmup)
	}
	if attack_warmup < 0
		return false
}


function sc_ai_wait_warmup() {
	if attack_warmup > dTime {
		if moveSpeed > 0.1  { // continue moving
			if sc_ai_get_to_point()
				sc_ai_wait_warmup_start()
		} else // play animation
			sc_player_stop_set()
	} else {
		tgAngle = point_direction(x, y+12, target.x, target.y+12)
		tgX = target.x
		tgY = target.y
		sc_player_move()  // turn to target
		sc_set_behaviour(sc_player_stop_set)
	}
	
}

function sc_ai_wait_power() {
	if not sc_does_exist(target) {
		sc_set_behaviour(sc_player_stop_set)
		return false
	}
	sc_player_stop_set()
	// check distance
	var _target_d = distance_to_point(target.x, target.y+12) - 12
	var _neededDist = action_list[| plannedActionNum][? "distance"]
	if _target_d > _neededDist {
		sc_set_behaviour(sc_ai_follow_target)
		exit
	}
	sc_set_behaviour(sc_ai_hit_target)
	
}
