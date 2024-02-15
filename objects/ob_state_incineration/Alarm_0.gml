/// @desc Deal damage
event_inherited()

with pokemon_id {
	var _dmg = sc_calculate_numeric_damage(other.damage, id, _ELEMENTAL.flame, -1)
	sc_hurt(_dmg, other.pokemon_id_attack, other.action)
	sc_logging_state_loses(id, other.name, "burned", "health", -_dmg)
	instance_create_layer(x + random(20)-10, y + random(20)-10, "Particles", ob_particle_text, {
		caption : "-" + string(_dmg),
		image_blend : c_orange
	})

}

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
