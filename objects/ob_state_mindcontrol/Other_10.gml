/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}


timeout = frames_rate * ds_map_find_value(action[? "active"], "state_time");
timeout *= 1 + action[?"lvlup_mod"]
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


