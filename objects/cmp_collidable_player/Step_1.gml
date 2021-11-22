/// @desc

//if not init
//	event_perform(ev_other, ev_user0)
if not instance_exists(coll_area)
	event_perform_object(cmp_collidable_player, ev_create,0)
	
coll_area.x = x + hspeed
coll_area.y = y + vspeed + 12

