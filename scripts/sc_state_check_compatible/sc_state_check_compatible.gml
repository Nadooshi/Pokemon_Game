function sc_state_check_compatible(_action) {
	// for ob_pokemon
	var _ins_sign  = ds_map_find_value(_action[? "active"], "in_state_sign")
	var _ins_state = ds_map_find_value(_action[? "active"], "in_state")
	var _ok = undefined
	
	var _st 
	if _ins_state != _ABILITY_STATE.none {
		for (var i=0; i<ds_list_size(states); i++) {
			_st = ds_list_find_value(states, i)
			if instance_exists(_st)
			if _ins_sign = 1 {  // only if NO in_state
				if _st.image_index = _ins_state {
					_ok = false
					break
				}
			} else  // only if in_state present (YES)
			if _st.image_index = _ins_state {
				_ok = true
				break
			} else
				_ok = false
		}
		if is_undefined(_ok) {
			_ok = true
			if _ins_sign = 0   // only if in_state present (YES)
				_ok = false
		}
		if not _ok {
			with instance_create_layer(x, y, "Particles", ob_particle_text)
				caption = _action[? "active"][? "name"] + " failed!"
			return false
		}
	}
	
	return true
}

