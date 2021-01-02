/// @desc Deal damage

var _dmg = sc_calculate_action_damage(action, pokemon_id_attack.pokemon_map, pokemon_id)

with pokemon_id_attack
	if other.pokemon_id != id 
		sc_hurt(_dmg, other.pokemon_id, other.action)
		
sc_logging_damage(pokemon_id, pokemon_id_attack, action, _dmg)

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
