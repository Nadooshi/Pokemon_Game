/// @desc 

// Inherit the parent event
event_inherited();
period = 30
hit_count = 0;
modify = 1

image_index = _ABILITY_STATE.block

// State events
onDamage = function (_dmg, _damaged_player_id, _action, _att_player, _state_id) {
	// returns modified damage value

	if _damaged_player_id.parry_mod > _state_id.modify
		_damaged_player_id.parry_mod = _state_id.modify

	_dmg *= _damaged_player_id.parry_mod
	with _damaged_player_id
	with instance_create_layer(x, y, "Particles", ob_particle_text)
		caption = ("Parry x" + string_format(_state_id.modify * 100, 3, 0) + " %")
	return _dmg	
}
