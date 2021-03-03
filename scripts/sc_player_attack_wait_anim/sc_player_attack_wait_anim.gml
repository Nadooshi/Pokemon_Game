function sc_player_attack_wait_anim() {

	if not instance_exists(attack_ob_id) {
		canMove = true
		sc_set_behaviour(sc_player_stop_set)
	}



}
