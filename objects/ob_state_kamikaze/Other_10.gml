/// @desc Init

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _mod = 0.5 
if (action[? "element"] != _ELEMENTAL.none) or (action[? "material"] != _MATERIAL.none)
	_mod = 1
_mod *= 1 + action[?"lvlup_mod"]

action[? "dmg_element"] = pokemon_id.health_cur * _mod
action[? "dmg_material"] = pokemon_id.health_cur * _mod
alarm[0] = period;


