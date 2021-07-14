function sc_check_reaching_target() {
	// for ob_pokemon
	if sc_does_exist(target)
	if position_stage = _ATTACK_TG.ground {
		if collision_line(x, y+12, target.x, target.y+12, ob_hazard, false, false) {
			sc_set_move_component(cmp_moving_path)
			tgAngle = point_direction(x, y, path_target.x, path_target.y)
			tgX = path_target.x
			tgY = path_target.y
			return false
		} else {
			sc_set_move_component(cmp_moving)
			return true
		}
	}	

}