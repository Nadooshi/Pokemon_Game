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
	//target = sc_find_nearest_target(id)
	//var _target_d = 0
	//if sc_does_exist(target) {
	//	_target_d = distance_to_point(target.x, target.y)
	//	tgAngle = point_direction(x, y, target.x, target.y)
	//	if _target_d > 16 // 16
	//		sc_player_move_set()
	//	else 
	//		sc_player_stop_set()
	//	tgX = target.x
	//	tgY = target.y
	//}
	scBehaviour = sc_ai_idle
	timeout = 5 + random(20)
}
