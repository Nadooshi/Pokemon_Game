/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = 0.5 //ds_map_find_value(action[? "active"], "state_time");
hit_count = _t * 2

alarm[0] = period;
damage = sc_calculate_formula(5, action[? "act_force"], action[? "pa_lvl"], action[? "act_force"], ds_map_find_value(action[? "active"], "state_value"), action[? "level"])
damage = sc_calculate_numeric_damage(damage, pokemon_id_attack, _ELEMENTAL.wind, -1)
knock_dir = point_direction(action[? "lastX"], action[? "lastY"], pokemon_id.x, pokemon_id.y)
with pokemon_id
	sc_hurt(other.damage, other.pokemon_id_attack, other.action)

sc_logging_state_cursed(pokemon_id, name, "thrown to the side")
sc_logging_state_loses(pokemon_id, name, "impact", "health", damage)

