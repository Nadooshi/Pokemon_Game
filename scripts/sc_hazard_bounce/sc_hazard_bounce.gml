function sc_hazard_bounce(){
// for ob_collision_area

x = xprevious
y = yprevious

if place_meeting(x + parent.hspeed, y, other) {
	parent.hspeed =0
}

if place_meeting(x, y + parent.vspeed, other) {
	parent.vspeed =0
}
if place_meeting(x + parent.hspeed, y + parent.vspeed, other) {
	parent.hspeed =0
	parent.vspeed =0
}


if place_meeting(x, y, other) {
	do {
		var _dir = point_direction(other.x, other.y, x, y)
		x = x + lengthdir_x(1, _dir)
		y = y + lengthdir_y(1, _dir)
	}
	until not place_meeting(x, y, other)
}



parent.moveSpeed = parent.speed
parent.x = x
parent.y = y - 12


}