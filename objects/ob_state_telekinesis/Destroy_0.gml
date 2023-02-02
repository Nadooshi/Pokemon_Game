/// @desc
event_inherited();

with pokemon_id_attack
	sc_canMove(true)

with pokemon_id {
	instance_change(ob_player, false)

	var _sp = asset_get_index("sp_pokeworld_" + string(pokemon_map[? "face"]))
	if sprite_exists(_sp)
		sprite_index = _sp

	frameSpeed = 0
	maxSpeed = o_maxSpeed
	_z = 0

	image_speed = 0
	position_stage = _ATTACK_TG.ground

	sc_player_stop_set()

	if health_cur<=0
		event_perform_object(ob_player, ev_destroy, 0)
		
	event_perform(ev_step, ev_step_begin)
	sc_canMove(true)
}
