/// @desc Deal damage
with pokemon_id_attack
	if other.pokemon_id != id
		sc_hurt(other.damage)

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
