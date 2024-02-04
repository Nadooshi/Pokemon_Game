/// @desc 

if not canMove
	exit

counter++

// find target
if counter mod 100 = 0 {
	target = instance_find(ob_cursor, 0)

	if sc_does_exist(target, undefined, "'target' in Step") {
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


// for barrier
if not instance_exists(target) exit
if doActionNum < 0 exit

var _a_map = action_list[| doActionNum]
if not ds_exists(_a_map, ds_type_map) exit

if _a_map[? "type"] = _ATTACK_TYPE.barrier {
	tgX += _target_d *0.25 * sin(direction)
	tgY += _target_d *0.25 * cos(direction)
}


