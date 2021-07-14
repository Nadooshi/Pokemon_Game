/// @desc create path

if not sc_does_exist(target) {
	// reset move_component
	sc_set_move_component(cmp_moving)
}

mp_potential_settings(180, 90, 8, true)
//mp_potential_path_object(path_target.path, tgX, tgY, maxSpeed*10, 1.5, ob_collision_area)



