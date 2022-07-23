/// @desc floating


if c_dir != tg_dir {
	if (tg_dir > c_dir)
		c_dir++
	if c_dir < tg_dir
		c_dir = tg_dir
	
	if (tg_dir < c_dir)
		c_dir--
	if c_dir > tg_dir
		c_dir = tg_dir
}
direction = c_dir

x = clamp(x, 0, room_width)
y = clamp(y, 0, room_height)
