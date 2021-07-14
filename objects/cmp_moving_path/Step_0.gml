/// @desc


//direction = point_direction(x, y, path_target.x, path_target.y)

if path_target.path_position > 0.99 {
	sc_set_move_component(cmp_moving)
	exit
}

if point_distance(x, y, path_target.x, path_target.y) > 80 {
	// recreate path
	event_perform_object(cmp_moving_path, ev_cleanup, 0)
	event_perform_object(cmp_moving_path, ev_create, 0)
	
}

//if collision_line(x, y+12, target.x, target.y+12, ob_hazard, false, false) {
////	show_message("Path ended. Target not reached")
//	event_perform_object(cmp_moving_path, ev_cleanup, 0)
//	event_perform_object(cmp_moving_path, ev_create,  0)
//	exit
//}
	

event_inherited()

