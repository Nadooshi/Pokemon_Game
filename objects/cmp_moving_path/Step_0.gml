/// @desc


tgAngle = point_direction(x, y, path_target.x, path_target.y)

if path_target.path_position > 0.95
if collision_line(x, y+12, target.x, target.y+12, ob_hazard, false, false) {
	show_message("Path ended. Target not reached")
	event_perform_object(cmp_moving_path, ev_cleanup, 0)
	event_perform_object(cmp_moving_path, ev_create,  0)
	exit
}
	

event_inherited()

