/// @desc  Parallax

var _dx = room_width*0.5 - mouse_x
var _dy =( room_height*0.5 - mouse_y) * 0.5

var _fr = noone
for (var i=_SIZE.tiny; i<_SIZE.immobile; i++) {
	for (var j=0; j<array_length(frames[? ob_frame][? i]); j++) {
		_fr = frames[? ob_frame][? i][j]
		_fr.x = _fr._oX + _dx * layer_coeffs[i]
		_fr.y = _fr._oY + _dy * layer_coeffs[i]
	}
	for (var j=0; j<array_length(frames[? ob_frame1][? i]); j++) {
		_fr = frames[? ob_frame1][? i][j]
		_fr.x = _fr._oX + _dx * layer_coeffs[i]
		_fr.y = _fr._oY + _dy * layer_coeffs[i]
	}
}

