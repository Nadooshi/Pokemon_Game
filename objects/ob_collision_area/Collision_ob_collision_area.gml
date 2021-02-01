/// @desc

if not sc_does_exist(parent) or not sc_does_exist(other.parent) {
	instance_destroy()
	exit
}

if (parent.depth > other.parent.depth+6) or
   (parent.depth < other.parent.depth-6) 
   exit

other.parent.collided_with = parent
with other.parent
	event_perform(ev_other, ev_user1)

