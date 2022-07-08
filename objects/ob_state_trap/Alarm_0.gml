/// @desc Deal damage


alarm[0] = period;

with pokemon_id
	sc_hurt(other.damage, other.pokemon_id_attack, other.action)

if --hit_count < 0
	instance_destroy()
	