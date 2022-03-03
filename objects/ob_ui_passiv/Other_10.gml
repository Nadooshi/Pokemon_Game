/// @desc

// Inherit the parent event
event_inherited();
visible = false
if instance_exists(selected_id) {
	with selected_id {
		animation_set[? "time"][? "first"] = alarm_get(0)
		animation_set[? "time"][? "second"] = alarm_get(1)
	}
	if selected_id.animation_set[? "main_stat"][? "first"] != -1
	if parameter_name = "passive_1" {
		next_animation[? "canvas"] = selected_id.animation_set[? "anim"][? "first"]
		next_animation[? "state_main"] = selected_id.animation_set[? "main_stat"][? "first"]
		next_animation[? "state_term"] = selected_id.animation_set[? "stat_term"][? "first"]
		next_animation[? "biome_term"] = selected_id.animation_set[? "biome_term"][? "first"]
		next_animation[? "time"] = selected_id.animation_set[? "time"][? "first"]
		visible = true
	}
	if selected_id.animation_set[? "main_stat"][? "second"] != -1
	if parameter_name = "passive_2" {
		next_animation[? "canvas"] = selected_id.animation_set[? "anim"][? "second"]
		next_animation[? "state_main"] = selected_id.animation_set[? "main_stat"][? "second"]
		next_animation[? "state_term"] = selected_id.animation_set[? "stat_term"][? "second"]
		next_animation[? "biome_term"] = selected_id.animation_set[? "biome_term"][? "second"]
		next_animation[? "time"] = selected_id.animation_set[? "time"][? "second"]
		visible = true
	}
	
	if animation[? "state_main"] = _ABILITY_STATE.none
		visible = false
}
