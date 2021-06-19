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

mp_potential_settings(90, 20, 0, true)
mp_potential_path_object(path_target.path, tgX, tgY, maxSpeed*10, 2.5, ob_collision_area)

instance_activate_object(coll_area)

with path_target {
	path_start(path, other.maxSpeed, path_action_stop, true);
}



