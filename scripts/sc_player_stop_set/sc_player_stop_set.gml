function sc_player_stop_set() {

	if object_index = ob_player_flying {
		moveSpeed = 0
		frameSpeed = 0.1
	
		frame = (frame + frameSpeed) mod 2
	} else {
		moveSpeed = 0
		frameSpeed = 0
		frame = 0
	}
	doMove = false
	sc_set_move_component(cmp_moving)

	image_index = dirframe[dir] + floor(frame)



}
