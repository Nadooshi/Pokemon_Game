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
	if object_exists(_state_obj)
		// check apply state rate
	var _ok = false
	if passive_state1[? "in_health_sign"] = 0 // below
		if (health_cur / health_max * 100) < passive_state1[? "marker_health"]
			_ok = true
	if passive_state1[? "in_health_sign"] = 1 // over
		if (health_cur / health_max * 100) > passive_state1[? "marker_health"]
			_ok = true
	if _ok {
		_ok = false
		if _r_ <= _rate {
			var p_action = ds_map_create()
			p_action[? "active"] = passive_state1
			sc_apply_state(_state_obj, 0, id, p_action)
			ds_map_destroy(p_action)
			p_action = noone
		}
		
		alarm_set(0, (passive_state1[? "state_time"] + passive_state1[? "state_cooldown"]) * 60)
	} else
		alarm_set(0, (passive_state1[? "state_cooldown"]) * 60)
	
}

