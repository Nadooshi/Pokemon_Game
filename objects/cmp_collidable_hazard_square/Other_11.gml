/// @desc Atfer collision


if is_like(collided_with.object_index, ob_player) 
with collided_with.coll_area {
	speed = 1 //parent.speed
	direction = point_direction(xprevious, yprevious, x, y) //parent.direction
	move_bounce_solid(false)
	x += hspeed
	y += vspeed
	parent.x = x// - hspeed
	parent.y = y - 12// - vspeed
	speed = 0
	direction = 0
}
