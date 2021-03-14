function sc_ai_set_flee() {
	
	var _get_new_cover = true
	if sc_does_exist(target)
		_get_new_cover = (not is_like(target.object_index, ob_hiding_mark))
		
	if _get_new_cover
		target = sc_find_cover(id)
		
	if sc_does_exist(target)
		sc_set_behaviour(sc_ai_flee)
}

function sc_ai_flee() {
	if sc_does_exist(target) {
		tgX = target.x
		tgY = target.y
		if sc_ai_get_to_point() {
			sc_player_stop_set()
			if courage_cur >= 100 {
				// switch back to normal ai
				target = noone
				sc_set_behaviour(sc_player_stop_set)
			}
		}
	} else {
		target = noone
		//sc_set_behaviour(sc_player_stop_set)
		sc_ai_set_flee()
	}
}

function sc_find_cover(_pokemon) {
	// returns ob_hiding_mark
	var _cover = instance_nearest(_pokemon.x, _pokemon.y, ob_hiding_mark)
	// find trainer-specific cover 
	return _cover
}
