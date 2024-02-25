/// @desc

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

alarm[0] = period;
modify = (ds_map_find_value(action[? "active"], "state_value") * 0.01) + action[? "lvlup_mod"]

var _dmg = damage * modify

sc_logging_state_loses(pokemon_id, name, "mutual damage", "health", _dmg)

with pokemon_id_attack
	sc_hurt(_dmg, other.pokemon_id, other.action)



