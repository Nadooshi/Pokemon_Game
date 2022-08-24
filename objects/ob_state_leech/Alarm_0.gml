/// @desc Deal damage
event_inherited()
with pokemon_id {
	var _dmg = sc_calculate_numeric_damage(other.damage,  id, other.action[? "element"], -1)
	health_cur = max(0, health_cur - _dmg)
	sc_hurt(0, other.pokemon_id_attack, other.action);
}
with pokemon_id_attack {
	health_cur += _dmg
	if health_cur > health_max 
		health_cur = health_max
}

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
sc_logging_state_loses(pokemon_id, name, "suction", "health", _dmg)
sc_logging_state_rises(pokemon_id_attack, name, "absorb", "health", _dmg)

