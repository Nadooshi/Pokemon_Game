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
	if object_exists(_state_obj)
		// check apply state rate
	var _ok = false
	if passive_state2[? "in_health_sign"] = 0
		if (health_cur / health_max * 100) < passive_state2[? "marker_health"]
			_ok = true
	if passive_state2[? "in_health_sign"] = 1
		if (health_cur / health_max * 100) > passive_state2[? "marker_health"]
			_ok = true
	if _ok {
		_ok = false
		if _r_ <= _rate {
			var p_action = ds_map_create()
			p_action[? "active"] = passive_state2
			_ok = sc_apply_state(_state_obj, 0, id, p_action)
			ds_map_destroy(p_action)
		}
		if _ok
			alarm_set(0, max(alarm_get(0), 30))
			
		alarm_set(1, (passive_state2[? "state_time"] + passive_state2[? "state_cooldown"]) * 60)
	}
}


