// for ob_player
function sc_player_move_path(){
	
	var _p0 = floor(path_number*path_position)
	var _p1 = _p0
	if _p0 + 1 <= path_number
		_p1 = _p0 + 1	
	else {
		path_end()
		sc_set_behaviour(sc_player_stop_set)
		sc_player_animate()
		exit
	}
	var _px0 = path_get_point_x(path, _p0)
	var _py0 = path_get_point_y(path, _p0)
	var _px1 = path_get_point_x(path, _p1)
	var _py1 = path_get_point_y(path, _p1)

	direction = point_direction(_px0, _py0, _px1, _py1)
	sc_player_animate()
	
}
