/// @desc

if not sc_does_exist(parent, undefined, "'parent' in Step") or
   array_length(group) = 0 {
	instance_destroy()
	exit
}
if sc_does_exist(parent.target, undefined, "'parent.target' in Step") and parent.target != id {
	instance_destroy()
	exit
}

counter++

if (counter mod 20) = 0 {
	var _avg = sc_average_point(group)
	x = _avg[0]
	y = _avg[1]
}
