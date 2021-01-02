/// @desc Deal damage

with pokemon_id {
	var _dmg = sc_calculate_numeric_damage(other.damage, id, other.action[? "element"], -1)
	sc_hurt(_dmg, other.pokemon_id_attack, other.action)
}
alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
sc_logging_state_loses(pokemon_id, name, "burned", "health", -_dmg)
