/// @desc 

if not canMove
	exit

counter++

// find target
if counter mod 100 = 0 {
//	target = sc_find_nearest_target(id)
	target = instance_find(ob_cursor, 0)

	if sc_does_exist(target) {
		tgX = target.x
		tgY = target.y
		instance_deactivate_object(coll_area)
		path_end()
		mp_potential_settings(20, 10, 0, true)
		mp_potential_path_object(path, tgX, tgY, maxSpeed*10, 1.25, ob_collision_area)
		path_number = path_get_number(path)
		sc_player_move_set()
		var _sp = moveSpeed
		moveSpeed = 0
		path_start(path, _sp, path_action_stop, false)
		sc_set_behaviour(sc_player_move_path)
		instance_activate_object(coll_area)
	}
}


//scBehaviour = sc_player_stop_set()

//// bury
//if canMove {
//	if pokemon_map[?"digable"] > 0
//	if position_stage != _ATTACK_TG.underground
//		event_perform(ev_other, ev_user2)
		
//	if _target_d > 5
//		event_perform(ev_other, ev_user4)
//}

//if attack_timeout > 0 {
//	attack_timeout -= dTime
//	if instance_exists(target)
//	if attack_timeout <= 0 {
//		if doActionNum = -1 {
//			doActionNum = irandom(ds_list_size(action_list)-1)
//			// do attack
//			event_perform(ev_other, ev_user3)
//		}		
//		attack_timeout = random_range(0.3, 1)
//	}

//}

// for barrier
if not instance_exists(target) exit
if doActionNum < 0 exit

var _a_map = action_list[| doActionNum]
if not ds_exists(_a_map, ds_type_map) exit

if _a_map[? "type"] = _ATTACK_TYPE.barrier {
	tgX += _target_d *0.25 * sin(direction)
	tgY += _target_d *0.25 * cos(direction)
}


