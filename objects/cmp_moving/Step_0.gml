/// @desc 
try {
	speed = moveSpeed
}
catch (_exeption){
	speed = 0
}

depth = (room_height - y) * 0.5

x = clamp(x, 0, room_width)
y = clamp(y, 0, room_height)

