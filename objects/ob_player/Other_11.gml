/// @desc After collision

// Inherit the parent event
event_inherited();

if is_like(collided_with.object_index, ob_player) {
	if size >= collided_with.size
		collided_with.bouncing = true
}
