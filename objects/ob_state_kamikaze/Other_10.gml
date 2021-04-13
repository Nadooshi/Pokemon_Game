/// @desc Init

// Inherit the parent event
event_inherited();
var _mod = 0.5
if (action[? "element"] != _ELEMENTAL.none) or (action[? "material"] != _MATERIAL.none)
	_mod = 1

action[? "dmg_element"] = pokemon_id.health_cur * _mod
action[? "dmg_material"] = pokemon_id.health_cur * _mod
alarm[0] = period;


