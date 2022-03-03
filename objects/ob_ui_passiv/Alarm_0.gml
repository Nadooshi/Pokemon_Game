/// @desc

event_perform(ev_other, ev_user0)
ds_map_copy(animation , next_animation)
if visible
	sc_passiv_animation_set(animation[? "canvas"], animation[? "state_main"], animation[? "state_term"], animation[? "biome_term"])

