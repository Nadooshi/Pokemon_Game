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
	animation_set[? "main_stat"][? "second"] = passive_state2[? "state"]
	animation_set[? "stat_name"][? "second"] = passive_state1[? "name"]
	
	if passive_state2[? "in_health_sign"] = 0 // below
		if (health_cur / health_max * 100) < passive_state2[? "marker_health"]
			_ok = true
	if passive_state2[? "in_health_sign"] = 1 // over
		if (health_cur / health_max * 100) > passive_state2[? "marker_health"]
			_ok = true
	if not _ok		
		animation_set[? "anim"][? "second"] = "other_lock"
	
	var _cs = true
	var _cb = true
	if _ok {
		_ok = false
		if _r_ <= _rate {
			var p_action = ds_map_create()
			p_action[? "active"] = passive_state2
			p_action[? "lvlup_mod"] = 0
			sc_apply_state(_state_obj, 0, id, p_action)
			alarm_set(1, (passive_state2[? "state_time"] + passive_state2[? "state_cooldown"]) * frames_rate)
			animation_set[? "anim"][? "second"] = "apply"
			animation_set[? "time"][? "second"] = (passive_state2[? "state_time"] * frames_rate)
			if not sc_state_check_compatible(p_action) {
				_cs = false
				animation_set[? "anim"][? "second"] = "state_lock"
				animation_set[? "stat_term"][? "second"] = p_action[? "active"][? "in_state"]
			}
			if not sc_state_check_compatible_biome(p_action) {
				_cb = false
				animation_set[? "anim"][? "second"] = "biome_lock"
				animation_set[? "biome_term"][? "second"] = p_action[? "active"][? "biome"]
			}
			if not _cs and not _cb
				animation_set[? "anim"][? "second"] = "all_lock"

			ds_map_destroy(p_action)
			p_action = noone
		} else 
			animation_set[? "anim"][? "second"] = "rate_lock"
	}
	
}




