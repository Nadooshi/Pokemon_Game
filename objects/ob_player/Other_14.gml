/// @desc Fly

if pokemon_map[? "flyable"] != 0
if power_cur >= power_max * 0.5 {
	power_cur -= power_max * 0.5
	depth = -bbox_bottom * 0.5
	instance_change(ob_player_flying, false)
	event_perform_object(ob_player_flying, ev_create, 0)
	if init
		with instance_create_depth(x, y + 12, depth - 1, ob_particle)
			sprite_index = sp_holeworld_splash1
} else {
	attack_error = _ATTACK_ERROR.no_power
}
