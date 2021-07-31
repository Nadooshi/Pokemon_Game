/// @desc End teleport

if sc_does_exist(text)
	instance_destroy(text)

y += _z
instance_change(ob_player_teleport_end, true)

