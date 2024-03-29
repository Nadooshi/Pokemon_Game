/// @desc 

// Inherit the parent event
event_inherited();

timeout = frames_rate * ds_map_find_value(action[? "active"], "state_time");
trainer = pokemon_id.trainer
pokemon_id.trainer = pokemon_id_attack.trainer

with pokemon_id {
	unselectables++
	sc_composed_remove_component(control_component)
	prev_control_component = control_component
	control_component = cmp_control_ai
	sc_composed_add_component(control_component)
	sc_set_behaviour(sc_ai_give_up)
}


