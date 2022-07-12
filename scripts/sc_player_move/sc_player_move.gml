function sc_player_move() {

	// of ob_player

	// turn
	var aDiff = angle_difference(tgAngle, direction)
	if abs(aDiff) > 90 {
		moveSpeed = 0
		direction = tgAngle
	}
	// move
	if canMove {
		var _final_mxSpeed = (maxSpeed + speed_mod) * hab_maxSpeed_mod
		moveSpeed = max(0, min(moveSpeed + accel, _final_mxSpeed))
	}

	if (abs(aDiff) < dAngle)
		direction = tgAngle
	else
		direction += (dAngle * sign(aDiff))
	

	// animation
	if abs(angle_difference(direction, dirangle[d.Left ])) <= 60
		dir = d.Left
	if abs(angle_difference(direction, dirangle[d.Right])) <= 60
		dir = d.Right
	if abs(angle_difference(direction, dirangle[d.Up   ])) <= 30
		dir = d.Up
	if abs(angle_difference(direction, dirangle[d.Down ])) <= 30
		dir = d.Down
		
	frameSpeed = moveSpeed * 0.1

	frame = (frame + frameSpeed) mod 2
	image_index = dirframe[dir] + floor(frame)



}
