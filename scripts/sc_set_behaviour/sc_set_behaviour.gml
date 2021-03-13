// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sc_set_behaviour(script_or_function) {
	// for ob_player
	scBehaviour = script_or_function
	if scBehaviour != prev_behaviour {
		show_debug_message("AI: behaviour changed to " + script_get_name(scBehaviour) + "(" + string(scBehaviour) + ")")
		prev_behaviour = scBehaviour
	}

}
