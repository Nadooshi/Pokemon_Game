/// @desc

instance_deactivate_object(coll_area)
mp_potential_step_object(tgX, tgY, moveSpeed, ob_collision_area)

instance_activate_object(coll_area)

depth = (room_height - y) * 0.5

x = clamp(x, 0, room_width)
y = clamp(y, 0, room_height)

