/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = ds_map_find_value(action[? "active"], "state_time");
hit_count = _t * 2

alarm[0] = period;
damage = ds_map_find_value(action[? "active"], "state_value")
with pokemon_id
	sc_hurt(other.damage, other.pokemon_id_attack, other.action)


sc_logging_state_loses(pokemon_id, name, "trapped", "health", damage)
sc_logging_state_cursed(pokemon_id, name, "stuck in place")