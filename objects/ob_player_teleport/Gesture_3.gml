/// @desc
if ai_control = cmp_control_ai
	exit

//var _a = point_direction(oX, oY, x, y)
//var _d = point_distance(oX, oY, x, y)

x += event_data[? "posX" ] - dragX
y += event_data[? "posY" ] - dragY

//if point_distance(oX, oY - _z, x, y) >= t_dist {
//	x = oX + lengthdir_x(t_dist, _a)
//	y = (oY - _z ) + lengthdir_y(t_dist, _a)
//}



dragX = event_data[? "posX"]
dragY = event_data[? "posY"]
