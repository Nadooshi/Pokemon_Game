/// @arg damage
function sc_shield_damage(argument0) {

	// for ob_pokemon

	var _dmg = argument0;

	shield -= _dmg
	_dmg = 0

	with instance_create_layer(x, y, "Particles", ob_particle_text)
		caption = "Shield!"

	if shield < 0 {
		_dmg = -shield
		shield = 0
	}
	return _dmg
}
