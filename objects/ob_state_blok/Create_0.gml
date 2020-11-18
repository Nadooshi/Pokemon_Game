/// @desc 

// Inherit the parent event
event_inherited();
period = 30
hit_count = 0;

image_index = _ABILITY_STATE.block

// State events
onDamage = function (_dmg, _damaged_player_id) {
	// returns modified damage value
	_dmg = 0
	with _damaged_player_id
	with instance_create_layer(x, y, "Particles", ob_particle_text)
		caption = "Immune!"
	return _dmg	
}
