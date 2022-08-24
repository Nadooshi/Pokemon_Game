/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = ds_map_find_value(action[? "active"], "state_time");
hit_count = _t * 2

alarm[0] = period;

sc_logging_state_cursed(pokemon_id, name, "treacherously run away.")

old_threshold = pokemon_id.courage_threshold
pokemon_id.courage_threshold = 100.1

with pokemon_id {
	sc_ai_give_up()
	unselectables++
	sc_composed_remove_component(control_component)
	prev_control_component = control_component
	control_component = cmp_control_ai
	sc_composed_add_component(control_component)
}
