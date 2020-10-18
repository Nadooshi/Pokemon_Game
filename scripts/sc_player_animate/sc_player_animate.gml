// for ob_player
function sc_player_animate() {
	
	// animation
	if abs(angle_difference(direction, dirangle[d.Left ])) <= 60
		dir = d.Left
	if abs(angle_difference(direction, dirangle[d.Right])) <= 60
		dir = d.Right
	if abs(angle_difference(direction, dirangle[d.Up   ])) <= 30
		dir = d.Up
	if abs(angle_difference(direction, dirangle[d.Down ])) <= 30
		dir = d.Down

	frame = (frame + frameSpeed) mod 2
	image_index = dirframe[dir] + floor(frame)
	
}
