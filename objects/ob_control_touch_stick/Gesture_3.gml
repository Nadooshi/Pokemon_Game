/// @desc

var _x = event_data[? "guiposX"]
var _y = event_data[? "guiposY"]

dir_is_set = (point_distance(X, Y, _x, _y) >= deadzone)
if dir_is_set
	direction = point_direction(X, Y, _x, _y)

