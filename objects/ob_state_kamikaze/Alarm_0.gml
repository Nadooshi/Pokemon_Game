/// @desc Deal damage

var _dmg = sc_calculate_action_damage(action, pokemon_id.pokemon_map, pokemon_id_attack)

sc_logging_damage(pokemon_id, pokemon_id_attack, action, _dmg)
with pokemon_id
	sc_hurt(_dmg, id, other.action)
		

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
