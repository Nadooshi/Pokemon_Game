/// @desc 

switch phase {
case 0:
	flash_alpha += d_alpha
	if flash_alpha >=1 {
		sprite_index = sp_poke_dead
		image_index = 0
		image_speed = 1
		phase = 2
	}
	if play_sound
		event_perform(ev_other, ev_user0)
	play_sound = false
	break
case 1:
	flash_alpha += d_alpha
	if flash_alpha >=1 {
		phase = 2
	}
}

