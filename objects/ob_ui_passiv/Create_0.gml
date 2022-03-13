/// @desc

// Inherit the parent event
event_inherited();
animation = ds_map_create()
next_animation = ds_map_create()
next_animation[? "canvas"] = ""
next_animation[? "state_main"] = -1
next_animation[? "state_term"] = -1
next_animation[? "biome_term"] = -1
next_animation[? "time"] = -1
next_animation[? "check_state"] = -1
next_animation[? "check_bio"] = -1
next_animation[? "state_anim"] = ""
next_animation[? "bio_anim"] = ""



function sc_passiv_animation_set(animation, att_main, att_state, att_bio, check_state, check_bio, state_anim, bio_anim) {
	if att_main < 0 {
		visible = false
		alarm_set(0, -1)
		skeleton_animation_set_ext(-1, 0)
		skeleton_animation_set_ext(-1, 1)
		skeleton_animation_set_ext(-1, 2)
	}
	state_anim = string(state_anim)
	bio_anim = string(bio_anim)
	animation = string(animation)
	if att_main < 0 
		att_main = ""
	else
		att_main = "States/s" + string(att_main)
	if att_state < 0
		att_state = ""
	else
		att_state = "States/s" + string(att_state)
	if att_bio < 0
		att_bio = ""
	else
		att_bio = "biome/b" + string(att_bio)
	if check_state = 0 check_state = "Confirmed"
	if check_state = 1 check_state = "Cancel"
	if check_bio = 0 check_bio = "Confirmed"
	if check_bio = 1 check_bio = "Cancel"
	
	if animation != "" {
		skeleton_attachment_set("shadow_state",att_main)
		skeleton_attachment_set("state", att_main)
		skeleton_attachment_set("term_state", att_state)
		skeleton_attachment_set("term_biome", att_bio)
		if not is_string(check_state)
			skeleton_attachment_set("check_state", -1)
		else {
			skeleton_attachment_set("check_state", check_state)
			skeleton_animation_set_ext(state_anim, 1)
		}
		if not is_string(check_bio)
			skeleton_attachment_set("check_biome", -1)
		else {
			skeleton_attachment_set("check_biome", check_bio)
			skeleton_animation_set_ext(bio_anim, 2)
		}
	}
	
	skeleton_animation_set_ext(animation,0)
}
