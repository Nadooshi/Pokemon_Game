function sc_set_behaviour(script_or_function) {
	// for ob_player
	scBehaviour = script_or_function
	if scBehaviour != prev_behaviour {
/*		show_debug_message( выдаёт ошибку с ob_barrier когда накладываются статы - отсутствует имя
			pokemon_map[? "title"] + " (" + string(id) + ") " +
			" behaviour changed to -->> " + 
			script_get_name(scBehaviour) + "(" + string(scBehaviour) + ")"
		)
*/		prev_behaviour = scBehaviour
		tgDelta = 0
	}

}
