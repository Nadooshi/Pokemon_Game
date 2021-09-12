/// @desc  Parallax

var _dx = room_width*0.5 - mouse_x
var _dy =( room_height*0.5 - mouse_y) * 0.5

for (var i=0; i<array_length(layer_ids); i++) 
for (var j=0; j<array_length(layer_objs[i]); j++)
if instance_exists(layer_objs[i][j]) {
	layer_objs[i][j].x = layer_objs[i][j]._oX + _dx * layer_coeffs[i]
	layer_objs[i][j].y = layer_objs[i][j]._oY + _dy * layer_coeffs[i]
}

