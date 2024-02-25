/// @desc 
if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}
if pokemon_id.trainer = -1 {
	instance_destroy()
	exit;	
}

var _t = ds_map_find_value(action[? "active"], "state_time");
_t *= 1 + action[?"lvlup_mod"]
hit_count = _t * 2

alarm[0] = period;
	
sc_logging_state_cursed(pokemon_id, name, "does not understand what is happening.")
doActionNum = -1
sc_canMove(true)
attack_warmup = 0

with pokemon_id {
	unselectables++
	sc_composed_remove_component(control_component)
	prev_control_component = control_component
	control_component = cmp_control_ai
	sc_composed_add_component(control_component)
}
