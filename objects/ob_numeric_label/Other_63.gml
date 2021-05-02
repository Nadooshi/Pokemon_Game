/// @desc Finish input

if async_load[? "id"] = msg
if async_load[? "status"] {
	value_str = async_load[? "result"]
	if parameter_name != "" {
		if string_digits(value_str)=""
			value_int = 0
		else
			value_int = real(string_digits(value_str))
		
		if ds_exists(map, ds_type_map)
			map[? parameter_name] = value_int
		
		event_perform(ev_other, ev_user0)
	}	
	editing = false
	msg = -1
}

