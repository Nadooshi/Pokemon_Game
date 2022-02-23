/// @desc

// Inherit the parent event
event_inherited();
animation = {
	canvas : "",
	state_main : -1,
	state_term : -1,
	biome_term : -1,
	time : -1
}
next_animation = {
	canvas : "",
	state_main : -1,
	state_term : -1,
	biome_term : -1,
	time : -1
}


function sc_passiv_animation_set(animation, att_main, att_state, att_bio) {
	if att_main < 0 {
		visible = false
		alarm_set(0, -1)
	}
	animation = string(animation)
	att_main = string(att_main)
	att_state = string(att_state)
	att_bio = string(att_bio)
		if animation != "" {
			skeleton_attachment_set("shadow_state",att_main)
			skeleton_attachment_set("state", att_main)
			skeleton_attachment_set("term_state", att_state)
			skeleton_attachment_set("term_biome", att_bio)
		}
	
		skeleton_animation_set(animation)
		alarm_set(0, skeleton_animation_get_duration(animation) * frames_rate)
	
}
