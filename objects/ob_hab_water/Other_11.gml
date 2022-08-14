/// @desc After collision

//other is ob_hab_water
if is_like(collided_with.object_index, ob_player) {
	if collided_with.position_stage = _ATTACK_TG.underground
	with collided_with.coll_area {
		sc_hazard_bounce()
	}
}


