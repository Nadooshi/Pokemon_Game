/// @desc 

if not init
	event_perform(ev_other, ev_user0)	

switch phase {
case 0:
	if image_index >= 3.9 
		phase = 1
	break
case 1:
	flash_alpha += d_alpha
	if flash_alpha <=0 {
		phase = 2
		image_speed = 0
		image_alpha = 0
		instance_destroy()
	}
	break
}
