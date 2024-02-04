/// @desc  Common collision code

if not sc_does_exist(parent, undefined, "'parent' in User0") {
	noParent = true
	instance_destroy()
	exit
}
if not sc_does_exist(other.parent, undefined, "'other.parent' in User0")
	exit

other.parent.collided_with = parent
other.parent.collided_from = other.id

with other.parent
	event_perform(ev_other, ev_user1) // after collision

if not variable_instance_exists(parent, "bouncing")
	exit
if parent.bouncing {
	sc_collide_bounce()
	with parent
		event_perform(ev_step, ev_step_begin) // stick ob_collides to new x, y of parent
	// then happens ev_step_end where parent sticks to ob_collides x, y
}
