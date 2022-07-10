function sc_player_attack_front() {

	timeout--

	// little lunge
	if timeout < 5 {
		x = oX + cos(degtorad(-direction)) * 6
		y = oY + sin(degtorad(-direction)) * 6
	}


	// attack end
	if timeout<=0 {
		sc_canMove(true)
		sc_set_behaviour(sc_player_stop_set)
		x = oX
		y = oY
	}



}
