/// @desc
switch phase {
case 0: {
	alpha += d_alpha
	vspeed *= 0.8
	if alpha >= 1 
	    phase = 1
	else 
		image_alpha = sqrt(alpha)
	break
}
case 1: {
	alpha *= 0.97
	vspeed = -0.1
	if alpha<=0.1
		instance_destroy()
}

}
