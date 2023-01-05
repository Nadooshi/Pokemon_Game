/// @desc  Common collision code

if not sc_does_exist(parent) {
	noParent = true
	instance_destroy()
	exit
}
if not sc_does_exist(other.parent)
	exit

other.parent.collided_with = parent
other.parent.collided_from = other.id
//parent.collided_from = id

with other.parent
	event_perform(ev_other, ev_user1) // after collision

