/// @desc

// Inherit the parent event
event_inherited();
visible = false
if instance_exists(selected_id) {
	with selected_id {
		animation_set[? "time"][? "first"] = round(alarm_get(0) / frames_rate)
		animation_set[? "time"][? "second"] = round(alarm_get(1) / frames_rate)
	}
	if selected_id.animation_set[? "main_stat"][? "first"] != -1
	if parameter_name = "passive_1" {
		next_animation[? "canvas"] = selected_id.animation_set[? "anim"][? "first"]
		next_animation[? "state_main"] = selected_id.animation_set[? "main_stat"][? "first"]
		next_animation[? "state_term"] = selected_id.animation_set[? "stat_term"][? "first"]
		next_animation[? "biome_term"] = selected_id.animation_set[? "biome_term"][? "first"]
		next_animation[? "time"] = selected_id.animation_set[? "time"][? "first"]
		next_animation[? "check_state"] = selected_id.animation_set[? "check_state"][? "first"]
		next_animation[? "check_bio"] = selected_id.animation_set[? "check_bio"][? "first"]
		next_animation[? "state_anim"] = selected_id.animation_set[? "state_anim"][? "first"]
		next_animation[? "bio_anim"] = selected_id.animation_set[? "bio_anim"][? "first"]
		visible = true
	}
	if selected_id.animation_set[? "main_stat"][? "second"] != -1
	if parameter_name = "passive_2" {
		next_animation[? "canvas"] = selected_id.animation_set[? "anim"][? "second"]
		next_animation[? "state_main"] = selected_id.animation_set[? "main_stat"][? "second"]
		next_animation[? "state_term"] = selected_id.animation_set[? "stat_term"][? "second"]
		next_animation[? "biome_term"] = selected_id.animation_set[? "biome_term"][? "second"]
		next_animation[? "time"] = selected_id.animation_set[? "time"][? "second"]
		next_animation[? "check_state"] = selected_id.animation_set[? "check_state"][? "second"]
		next_animation[? "check_bio"] = selected_id.animation_set[? "check_bio"][? "second"]
		next_animation[? "state_anim"] = selected_id.animation_set[? "state_anim"][? "second"]
		next_animation[? "bio_anim"] = selected_id.animation_set[? "bio_anim"][? "second"]
		visible = true
	}
	
	if animation[? "state_main"] = _ABILITY_STATE.none
		visible = false
}
