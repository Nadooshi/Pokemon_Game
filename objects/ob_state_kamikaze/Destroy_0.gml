/// @desc

// Inherit the parent event
event_inherited();

with pokemon_id_attack {
	health_cur = 0
	sc_hurt(health_max, id, other.action)
	sc_logging_state_cursed(id, other.name, "thereby knocks himself out of the fight.")
}
