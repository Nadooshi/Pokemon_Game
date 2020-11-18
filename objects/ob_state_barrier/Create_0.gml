/// @desc 

event_inherited()

image_index = _ABILITY_STATE.barrier;
period = 30;
hit_count = 1;

// State events
onDamage = function (_dmg, _damaged_player_id) {
	// returns modified damage value
	with _damaged_player_id {
		with instance_create_layer(x, y, "Particles", ob_particle_text)
			caption = "Shield!"
		// sc_shield_damage
		shield -= _dmg
		_dmg = max(0, _dmg-shield)
		
	//	shield -= _dmg
	//	_dmg = 0

	//	if shield < 0 {
	//		_dmg = -shield
	//		shield = 0
	//	}
	}
	return _dmg	
}
