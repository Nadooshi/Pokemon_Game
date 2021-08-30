/// @desc 

event_inherited()

image_index = _ABILITY_STATE.telekinesis;

dist = 0
_z = 0 // высота подлёта
attract_speed = 0
attract_dir = 0
upgea = 0
phi = 0
timeout = 0
init_timeout = 0


onDamage = function (_dmg, _damaged_player_id, _action, _pokemon_id_attack, _state_id) {
	// returns modified damage value
	// _state_id same as "self"
	var stun_action = ds_map_create()
	var stun_active = ds_map_create()
	stun_active[? "name"] = "capture"
	stun_active[? "state"] = _ABILITY_STATE.paralyze
	stun_active[? "in_state"] = _ABILITY_STATE.none
	stun_active[? "state_time"] = 1 // sec
	stun_action[? "active"] = stun_active
	with _pokemon_id_attack
		sc_apply_state(ob_state_paralyze, 0, _pokemon_id_attack, stun_action);
	ds_map_destroy(stun_action)
	stun_action = noone

	return _dmg	
}
