/// @desc Swoop

//if position_stage = _ATTACK_TG.ground {
	depth = -bbox_bottom * 0.5
	instance_change(ob_player_swoop, false)
	event_perform_object(ob_player_swoop, ev_create, 0)
	


