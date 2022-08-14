function sc_hazard_bounce(){
// for ob_collision_area
	
x = xprevious
y = yprevious

if place_meeting(x + parent.hspeed, y, other) {
	parent.hspeed = 0
}

if place_meeting(x, y + parent.vspeed, other) {
	parent.vspeed = 0
}
if place_meeting(x + parent.hspeed, y + parent.vspeed, other) {
	parent.hspeed = 0
	parent.vspeed = 0
}


parent.moveSpeed = parent.speed
parent.x = x
parent.y = y - 12


}