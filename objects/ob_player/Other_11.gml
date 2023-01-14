/// @desc After collision

// Inherit the parent event
event_inherited();

if is_like(collided_with.object_index, ob_player) {
	var _dir = point_direction(collided_from.x, collided_from.y, collided_with.x, collided_with.y)
	if (collided_with.position_stage = _ATTACK_TG.ground) and (position_stage = _ATTACK_TG.ground)
	if size >= collided_with.size {
		var _amount = max(moveSpeed, maxSpeed)
		with collided_with {
			x += lengthdir_x(_amount, _dir)
			y += lengthdir_y(_amount, _dir)
			event_perform_object(cmp_collidable, ev_step, ev_step_begin)
		}
	}
}
