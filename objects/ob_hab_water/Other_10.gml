/// @desc After collision

//other is ob_hab_water
if is_like(collided_with.object_index, ob_player) {
	if collided_with.position_stage = _ATTACK_TG.underground
	with collided_with.coll_area {
		x = xprevious
		y = yprevious
		event_perform(ev_collision, ob_hazard)
		
	}
}


