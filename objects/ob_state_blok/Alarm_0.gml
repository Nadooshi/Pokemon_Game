/// @desc
event_inherited()

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
