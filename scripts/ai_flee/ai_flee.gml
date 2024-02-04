function sc_ai_set_flee() {
	
	//sc_logging_info(trainer[? "name"] +"'s "+ pokemon_map[? "title"] + " (" + string(id) + ") try hiding behind cover. Run away")
	var _get_new_cover = true
	if sc_does_exist(target, undefined, "'target' in sc_ai_set_flee")
		_get_new_cover = (not is_like(target.object_index, ob_hiding_mark))
		
	if _get_new_cover
		target = sc_find_cover()
		
	if sc_does_exist(target, undefined, "'target' in sc_ai_set_flee")
		sc_set_behaviour(sc_ai_flee)
	else {
		target = noone
		sc_ai_retreat_start()
	}
		// dig // fly
	if object_index = ob_player {
		var c= choose(ev_user2, ev_user4)
		event_perform(ev_other, c)
	}
}

function sc_ai_flee() {
	if sc_does_exist(target, undefined, "'target' in sc_ai_flee") {
		tgX = target.x
		tgY = target.y
		tgAngle = point_direction(x, y+12, target.x, target.y+12)
		if sc_ai_get_to_point() {
			sc_player_stop_set()
			if (counter mod t_process_courage) = 0 
				courage_cur += courage_max_regen
		}
	} else {
		target = noone
		sc_ai_set_flee()
	}
	if courage_cur >= 99 {
		// switch back to normal ai
		target = noone
		sc_set_behaviour(sc_player_stop_set)
	}
}

function sc_find_cover() {
	var _cover_list = ds_list_create()
	var _n = collision_circle_list(x, y+12, retreat_dist, ob_cover, false, false, _cover_list, true)
	var _cover = undefined
	for (var i=0; i<_n; i++) {
		_cover = _cover_list[| i].h_marks[? trainer][? id]
		if not is_undefined(_cover)
			break
		
	}
	ds_list_destroy(_cover_list)
	return _cover
}

function sc_ai_retreat_start() {
	var _enemy = sc_find_nearest_target(id)
	if sc_does_exist(_enemy, undefined, "'_enemy' in sc_ai_retreat_start") {
		var _neededDist = retreat_dist
		var _dirtotg = point_direction(_enemy.x, _enemy.y+12, x, y+12)
		var _newdir = _dirtotg+random(30)-15
		tgX = _enemy.x + cos(_newdir)*_neededDist
		tgY = _enemy.y + sin(_newdir)*_neededDist
		sc_set_behaviour(sc_ai_retreat)
	} else {
		// switch back to normal ai
		target = noone
		sc_set_behaviour(sc_player_stop_set)
	}
	
	if courage_cur >= 99 {
		// switch back to normal ai
		target = noone
		sc_set_behaviour(sc_player_stop_set)
	}
}


function sc_ai_retreat() {
	if sc_ai_get_to_point() 
		sc_ai_retreat_start()
	
	if courage_cur >= 99 {
		// switch back to normal ai
		target = noone
		sc_set_behaviour(sc_player_stop_set)
	}
}
