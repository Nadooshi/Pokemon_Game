function sc_player_attack_swoop() {

	timeout--

	phi = pi * (1 - timeout/init_timeout)
	_z = 12 + sin(phi) * z_max
	other.x = x 
	other.y = y - _z


	// attack end
	if timeout<=0 {
		sc_canMove(true)
		sc_set_behaviour(sc_player_stop_set)
		x = oX
		y = oY
	}



}
