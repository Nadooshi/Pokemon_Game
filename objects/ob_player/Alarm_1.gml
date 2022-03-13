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
	animation_set[? "stat_name"][? "second"] = passive_state2[? "name"]
	
	if passive_state2[? "in_health_sign"] = 0 // below
		if (health_cur / health_max * 100) < passive_state2[? "marker_health"]
			_ok = true
	if passive_state2[? "in_health_sign"] = 1 // over
		if (health_cur / health_max * 100) > passive_state2[? "marker_health"]
			_ok = true
	if not _ok		
		animation_set[? "anim"][? "second"] = "other_lock"

	var p_action = ds_map_create()
	p_action[? "active"] = passive_state2
	p_action[? "lvlup_mod"] = 0
	animation_set[? "check_state"][? "second"] = ds_map_find_value(p_action[? "active"], "in_state_sign")
	if not sc_state_check_compatible(p_action) {
		animation_set[? "state_anim"][? "second"] = "state_lock"
		animation_set[? "stat_term"][? "second"] = p_action[? "active"][? "in_state"]
	} else {
		animation_set[? "state_anim"][? "second"] = "state_ok"
		animation_set[? "stat_term"][? "second"] = p_action[? "active"][? "in_state"]
	}
	animation_set[? "check_bio"][? "second"] = ds_map_find_value(p_action[? "active"], "biome_sign")
	if not sc_state_check_compatible_biome(p_action) {
		animation_set[? "bio_anim"][? "second"] = "biome_lock"
		animation_set[? "biome_term"][? "second"] = p_action[? "active"][? "biome"]
	} else {
		animation_set[? "bio_anim"][? "second"] = "biome_ok"
		animation_set[? "biome_term"][? "second"] = p_action[? "active"][? "biome"]
	}

	if _ok {
		_ok = false
		if _r_ <= _rate {
			sc_apply_state(_state_obj, 0, id, p_action)
			alarm_set(1, (passive_state2[? "state_time"] + passive_state2[? "state_cooldown"]) * frames_rate)
			animation_set[? "anim"][? "second"] = "apply"
			animation_set[? "time"][? "second"] = (passive_state2[? "state_time"] * frames_rate)
		} else 
			animation_set[? "anim"][? "second"] = "rate_lock"
	}
	ds_map_destroy(p_action)
	p_action = noone
}




