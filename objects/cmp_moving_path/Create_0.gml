/// @desc create path

path = path_add()

instance_deactivate_object(coll_area)

var _oIndex = image_index
image_index = pokemon_map[? "size"]

mp_potential_settings(30, 10, 0, false)
mp_potential_path_object(path, tgX, tgY, maxSpeed*10, 1.25, ob_collision_area)
path_number = path_get_number(path)
path_length = path_get_length(path)

image_index = _oIndex

instance_activate_object(coll_area)

//var _sp = moveSpeed
//moveSpeed = 0
path_start(path, 0, path_action_stop, false)
path_position = 0

