/// @desc End teleport

#macro COLL_CHECK_STEP 16

if sc_does_exist(text)
	instance_destroy(text)

var _a = point_direction(oX, oY-_z, x, y)

if not success {
	if point_distance(oX, oY-_z, x, y) > t_dist {	// too big distance
		x = oX + lengthdir_x(t_dist, _a)
		y = oY + lengthdir_y(t_dist, _a) - _z
	} else {										// collided with ob_hazard
		var _x = oX 
		var _y = oY
		var __x, __y
		repeat (t_dist div COLL_CHECK_STEP) {
			__x = _x + lengthdir_x(COLL_CHECK_STEP, _a)
			__y = _y + lengthdir_y(COLL_CHECK_STEP, _a)
			if position_meeting(__x, __y, ob_hazard) 
				break
			_x = __x
			_y = __y
		}
		x = _x
		y = _y - _z
	}
}

y += _z
instance_change(ob_player_teleport_end, true)
