/// @desc Bury

if pokemon_map[? "digable"] != 0
if power_cur >= power_max * 0.5 {
	power_cur -= power_max * 0.5
	depth = (room_height - bbox_bottom) * 0.75	
	instance_change(ob_player_buried, false)
	event_perform_object(ob_player_buried, ev_create, 0)
	if init
		with instance_create_depth(x, y + 12, depth - 1, ob_particle)
			sprite_index = sp_holeworld_splash
} else {
	attack_error = _ATTACK_ERROR.no_power
}

