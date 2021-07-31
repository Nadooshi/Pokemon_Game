/// @desc 

if not init
	event_perform(ev_other, ev_user0)	


flash_alpha += d_alpha

if flash_alpha >=0.5 {
	image_speed = 1
	image_alpha = 1
	spr_drawn[1] = sprite_index
}
if flash_alpha >=1 {
	spr_drawn[0] = noone
}