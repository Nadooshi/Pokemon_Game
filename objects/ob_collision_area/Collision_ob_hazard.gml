/// @desc
if place_meeting(x, y, other)
	show_message(object_get_name(object_index) + " is still in collision with " + object_get_name(other.object_index))

if place_meeting(x + parent.hspeed, y, other)
	parent.hspeed = 0
if place_meeting(x, y + parent.vspeed, other)
	parent.vspeed = 0
	
parent.moveSpeed = parent.speed
parent.x = x// + parent.hspeed
parent.y = y - 12// + parent.vspeed


