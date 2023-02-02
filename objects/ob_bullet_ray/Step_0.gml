/// @desc

// Inherit the parent event
event_perform_object(ob_bullet, ev_step, ev_step_normal);

if not init
	event_perform(ev_other, ev_user0)
