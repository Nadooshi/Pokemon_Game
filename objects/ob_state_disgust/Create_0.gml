/// @desc Reduce_accuracy

event_inherited()

image_index = _ABILITY_STATE.disgust;
period = 30;
hit_count = 1;
modify = 0

// State events
onDamage = function (_dmg, _damaged_player_id, _action, _pokemon_id_attack, _state_id) {
	// returns modified damage value
	// _state_id same as "self"
	switch _action[? "type"] {			
		case _ATTACK_TYPE.front:
		case _ATTACK_TYPE.lunge:
		case _ATTACK_TYPE.melee:
		case _ATTACK_TYPE.swoop:
		var stun_action = ds_map_create()
		var stun_active = ds_map_create()
		stun_active[? "name"] = "stun"
		stun_active[? "state"] = _ABILITY_STATE.stun
		stun_active[? "in_state"] = _ABILITY_STATE.none
		stun_active[? "state_time"] = /* self ? */_state_id.hit_count / 2
		stun_action[? "active"] = stun_active
		with _pokemon_id_attack
			sc_apply_state(ob_state_stun, 0, _pokemon_id_attack, stun_action);
		ds_map_destroy(stun_action)
	}	
	return _dmg	
}

