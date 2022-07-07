/// @desc Revenge can only work for the master.

event_inherited()

image_index = _ABILITY_STATE.revenge;
period = 30;
hit_count = 1;

onDamage = function (_dmg, _damaged_player_id, _action, _pokemon_id_attack, _state_id) {
	if _action[? "dmg_element"] > 0 {
		var _coef = _action[? "dmg_material"] / _action[? "dmg_element"]
		_action[? "dmg_material"] = (_pokemon_id_attack.health_max - _pokemon_id_attack.health_cur) * _coef
		_action[? "dmg_element"] = _action[? "damage"] - _action[? "dmg_material"]
	}
	_dmg = sc_calculate_action_damage(_action, _damaged_player_id, _pokemon_id_attack)
	
	
	return _dmg
}
