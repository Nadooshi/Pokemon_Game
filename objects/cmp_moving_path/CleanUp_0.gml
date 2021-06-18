/// @desc  Stop path

with path_target {
	path_end()
	path_delete(path)
}

if sc_does_exist(path_target) {
	instance_destroy(path_target)
}

sc_ai_get_to_point()
