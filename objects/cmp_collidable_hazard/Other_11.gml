/// @desc Atfer collision

var _dir = point_direction(coll_area.x, coll_area.y, collided_with.coll_area.x, collided_with.coll_area.y)

if is_like(collided_with.object_index, ob_player) {
	var _amount = max(collided_with.maxSpeed, collided_with.moveSpeed)
	collided_with.coll_area.x += lengthdir_x(_amount, _dir)
	collided_with.coll_area.y += lengthdir_y(_amount, _dir)
}
