/// @desc

if newexp > 0 {
	map[? "exp"] = newexp
	map[? "level"]++
	map[? "health"] = sc_calculate_formula(2, map[? "force"], map[? "level"])
	with ob_frame_pokemon
		event_perform(ev_other, ev_user0)
}

event_perform(ev_other, ev_user0)


