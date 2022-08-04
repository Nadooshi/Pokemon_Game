/// @desc

while (_y > camera_get_view_y(view_camera[0])) {
	_y = y - sprite_height * _ln
	draw_sprite(sprite_index, _img_start+_ln, x, _y)
	_ln++
}

