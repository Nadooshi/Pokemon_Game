function sc_ai_set_flee() {
//	if scBehaviour != sc_ai_flee {
		var _cover = instance_nearest(x, y, ob_cover)
		var _hmark = noone
		if instance_exists(_cover) {
			var _hmark = _cover.h_marks[? trainer][? id]
			if not is_undefined(_hmark)
			if instance_exists(_hmark) {
				tgX = _hmark.x
				tgY = _hmark.y
				scBehaviour = sc_ai_flee
			}
		}
//	}
}

function sc_ai_flee() {
	if sc_ai_get_to_point() {
		sc_player_stop_set()
		if courage_cur >= 100 {
			// switch back to normal ai
			scBehaviour = sc_player_stop_set
		}
	}
}
