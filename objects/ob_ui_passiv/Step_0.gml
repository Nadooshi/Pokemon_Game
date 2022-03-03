/// @desc

with selected_id {
	if other.parameter_name = "passive_1"
		other.animation[? "time"] = alarm_get(0)
		
	if other.parameter_name = "passive_2"
		other.animation[? "time"] = alarm_get(1)
}
if instance_exists(selected_id) {
	if not visible
		alarm_set(0, 1)
	
}

