/// @desc

event_perform(ev_other, ev_user0)
ds_map_copy(animation , next_animation)
if visible
	sc_passiv_animation_set(animation[? "canvas"], animation[? "state_main"], animation[? "state_term"], animation[? "biome_term"], animation[? "check_state"], animation[? "check_bio"], animation[? "state_anim"], animation[? "bio_anim"])

alarm_set(0, frames_rate)
