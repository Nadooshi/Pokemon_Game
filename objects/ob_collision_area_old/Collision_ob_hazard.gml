/// @desc

//if place_meeting(x, y, other)
//	show_message(object_get_name(object_index) + " is still in collision with " + object_get_name(other.object_index))

if is_like(parent.object_index, ob_player)
if parent.position_stage <> _ATTACK_TG.ground
	exit

sc_hazard_bounce()
