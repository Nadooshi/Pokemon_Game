/// @desc 

if not sc_does_exist(parent, undefined, "'parent' in Step") {
	instance_destroy()
	exit
}

if not parent.init
	exit

with parent {
	if ds_exists(other.coll_list, ds_type_list)
		ds_list_clear(other.coll_list)
	if ds_exists(collided_with_list, ds_type_list)
	ds_list_clear(collided_with_list)
	var _count = 0
	if (action[? "tgTo"] & _ATTACK_TG.ground) > 0
		_count += collision_line_list(x1, y1, x2, y2, ob_collide_land, false, false, other.coll_list, false)
	if (action[? "tgTo"] & _ATTACK_TG.air) > 0
		_count += collision_line_list(x1, y1, x2, y2, ob_collide_air , false, false, other.coll_list, false)
	if (action[? "tgTo"] & _ATTACK_TG.underground) > 0
		_count += collision_line_list(x1, y1, x2, y2, ob_collide_buried, false, false, other.coll_list, false)

	for (var i=0; i<_count; i++)
	if ds_list_find_index(collided_with_list, other.coll_list[| i].parent) = -1
		ds_list_add(collided_with_list, other.coll_list[| i].parent)

	if _count > 0
		event_perform(ev_other, ev_user1)  // after collision
}

parent = noone
instance_destroy()
