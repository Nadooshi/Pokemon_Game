/// @desc apply passive state
//STAT
if sc_does_exist(passive_state2) {
	var _state_obj = state_object[passive_state2[? "state"]];
	if not object_exists(_state_obj) {
		ds_map_destroy(passive_state2)
		passive_state2 = noone
		alarm_set(0, 30)
		exit
	}
	var _s_rate = passive_state2[? "state_rate"]
	var _rate = 25*(_s_rate + 1)
	var _r_ = random_range(0, 100)

	alarm_set(1, (passive_state2[? "state_cooldown"]) * frames_rate)

		// check apply state rate
	var _ok = false
	animation_set[1].main_stat = passive_state2[? "state"]
	
	if passive_state2[? "in_health_sign"] = 0 // below
		if (health_cur / health_max * 100) < passive_state2[? "marker_health"]
			_ok = true
	if passive_state2[? "in_health_sign"] = 1 // over
		if (health_cur / health_max * 100) > passive_state2[? "marker_health"]
			_ok = true
	if not _ok		
		animation_set[1].anim = "other_lock"
	
	var _cs = false
	var _cb = false
	if _ok {
		_ok = false
		if _r_ <= _rate {
			var p_action = ds_map_create()
			p_action[? "active"] = passive_state2
			p_action[? "lvlup_mod"] = 0
			sc_apply_state(_state_obj, 0, id, p_action)
			alarm_set(1, (passive_state2[? "state_time"] + passive_state2[? "state_cooldown"]) * frames_rate)
			animation_set[1].anim = "apply"
			animation_set[1].time = (passive_state2[? "state_time"] * frames_rate)
			if not sc_state_check_compatible(p_action) {
				_cs = true
				animation_set[1].anim = "state_lock"
				animation_set[1].stat_term = p_action[? "active"][? "in_state"]
			}
			if not sc_state_check_compatible_biome(p_action) {
				_cb = true
				animation_set[1].anim = "biome_lock"
				animation_set[1].bio_term = p_action[? "active"][? "biome"]
			}
			if not (_cs && _cb)	
				animation_set[1].anim = "all_lock"

			ds_map_destroy(p_action)
			p_action = noone
		} else 
			animation_set[1].anim = "rate_lock"
	}
	
}




