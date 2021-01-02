/// @desc

// Inherit the parent event

alarm[0] = period;
modify = ds_map_find_value(action[? "active"], "state_value") * 0.01
var _dmg = damage * modify

sc_logging_state_loses(pokemon_id, name, "mutual damage", "health", _dmg)

with pokemon_id_attack
	sc_hurt(_dmg, other.pokemon_id, other.action)



