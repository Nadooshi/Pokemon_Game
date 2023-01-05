/// @desc Bury

instance_change(ob_player, false)
event_perform_object(ob_player_buried, ev_destroy, 0)

sc_set_coll_areas(true, false, false)
with instance_create_depth(x, y + 12, depth - 1, ob_particle)
	sprite_index = sp_holeworld_splash

