function sc_collide_bounce(){
// for ob_collide

x = xprevious
y = yprevious

if place_meeting(x + parent.hspeed, y, other) {
	parent.hspeed =0
} else
if place_meeting(x, y + parent.vspeed, other) {
	parent.vspeed =0
} else
if place_meeting(x + parent.hspeed, y + parent.vspeed, other) {
	parent.hspeed =0
	parent.vspeed =0
}


if place_meeting(x, y, other) {
	var _dir = point_direction(other.x, other.y, x, y)
	x = x + lengthdir_x(1, _dir)
	y = y + lengthdir_y(1, _dir)
	parent.x = x
	parent.y = y
}

parent.moveSpeed = parent.speed

}