/// @desc 

health_cur -= health_max * 0.1
if health_cur <= 0 
	event_perform(ev_destroy, 0)

alarm_set(0, 100)