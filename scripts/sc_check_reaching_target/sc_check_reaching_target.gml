function sc_check_reaching_target() {
	// for ob_pokemon
	if collision_line(x, y+12, target.x, target.y+12, ob_hazard, false, false) {
		sc_set_move_component(cmp_moving_path)
		return false
	} else {
		sc_set_move_component(cmp_moving)
		return true
	}
	

}