/// @desc create path

path_target = instance_create_layer(x, y, "Game", ob_hiding_mark)
path_target.path = path_add()

instance_deactivate_object(coll_area)
if sc_does_exist(target) {
	tgX = target.x
	tgY = target.y
} else {
	// reset move_component
	sc_set_move_component(cmp_moving)
}

with path_target {
	mp_potential_settings(120, 10, 15, true)
	mp_potential_path_object(path, other.tgX, other.tgY, other.maxSpeed*10, 1.5, ob_collision_area)
}

instance_activate_object(coll_area)

if path_get_length(path_target.path) = 0 {
	sc_set_move_component(cmp_moving)
}

with path_target 
	path_start(path, other.maxSpeed, path_action_stop, true);




