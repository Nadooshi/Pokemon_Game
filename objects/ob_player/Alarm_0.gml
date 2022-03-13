/// @desc apply passive state
//STAT
if sc_does_exist(passive_state1) {
	var _state_obj = state_object[passive_state1[? "state"]];
	if not object_exists(_state_obj) {
		ds_map_destroy(passive_state1)
		passive_state1 = noone
		alarm_set(1, 30)
		exit
	}
	var _s_rate = passive_state1[? "state_rate"]
	var _rate = 25*(_s_rate + 1)
	var _r_ = random_range(0, 100)
	
	alarm_set(0, (passive_state1[? "state_cooldown"]) * frames_rate)

		// check apply state rate
	var _ok = false
	animation_set[? "main_stat"][? "first"] = passive_state1[? "state"]
	animation_set[? "stat_name"][? "first"] = passive_state1[? "name"]

	if passive_state1[? "in_health_sign"] = 0 // below
		if (health_cur / health_max * 100) < passive_state1[? "marker_health"] 
			_ok = true			
	if passive_state1[? "in_health_sign"] = 1 // over
		if (health_cur / health_max * 100) > passive_state1[? "marker_health"] 
			_ok = true
	if not _ok
	animation_set[? "anim"][? "first"] = "other_lock"
		
	var p_action = ds_map_create()
	p_action[? "active"] = passive_state1
	p_action[? "lvlup_mod"] = 0
	animation_set[? "check_state"][? "first"] = ds_map_find_value(p_action[? "active"], "in_state_sign")
	if not sc_state_check_compatible(p_action) {
		animation_set[? "state_anim"][? "first"] = "state_lock"
		animation_set[? "stat_term"][? "first"] = p_action[? "active"][? "in_state"]
	} else {
		animation_set[? "state_anim"][? "first"] = "state_ok"
		animation_set[? "stat_term"][? "first"] = p_action[? "active"][? "in_state"]				
	}
	animation_set[? "check_bio"][? "first"] = ds_map_find_value(p_action[? "active"], "biome_sign")
	if not sc_state_check_compatible_biome(p_action) {
		animation_set[? "bio_anim"][? "first"] = "biome_lock"
		animation_set[? "biome_term"][? "first"] = p_action[? "active"][? "biome"]
	} else {
		animation_set[? "bio_anim"][? "first"] = "biome_ok"
		animation_set[? "biome_term"][? "first"] = p_action[? "active"][? "biome"]				
	}

	if _ok {
		_ok = false
		if _r_ <= _rate {
			//var p_action = ds_map_create()
			//p_action[? "active"] = passive_state1
			//p_action[? "lvlup_mod"] = 0
			sc_apply_state(_state_obj, 0, id, p_action)
			alarm_set(0, (passive_state1[? "state_time"] + passive_state1[? "state_cooldown"]) * frames_rate)
			animation_set[? "anim"][? "first"] = "apply"
			animation_set[? "time"][? "first"] = (passive_state1[? "state_time"] * frames_rate)
		} else 
			animation_set[? "anim"][? "first"] = "rate_lock"
	}
	ds_map_destroy(p_action)
	p_action = noone

}

