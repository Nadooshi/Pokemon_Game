/// @desc  Init

// Inherit the parent event

event_inherited();

if not instance_exists(pokemon_id)
	exit

	var _pokemon_speed = pokemon_id.maxSpeed * 1.5
	var _t = 60 * 0.1 * action[? "range"]
	var _d = 999
	if instance_exists(pokemon_id.target)
		_d = distance_to_point(pokemon_id.target.x, pokemon_id.target.y+12) / _pokemon_speed + 8
	_t = min(_t, _d)

	// create bullet
	bullet = instance_create_layer(x, y+9, "Particles", ob_bullet_mortar)
	ds_map_copy(bullet.action, action)
	bullet.pokemon_id = pokemon_id
	bullet.hurt_time = hurt_time
	bullet.timeout = _t //60 * 0.1 * action[? "range"]
	bullet.upgea = _t
	bullet.direction = pokemon_id.direction
	bullet.moveSpeed = _pokemon_speed
	bullet.damage_mod = damage_mod
	bullet.accuracy_mod = accuracy_mod

var _snd = choose(snd_attack_lunge_0, snd_attack_lunge_1, snd_attack_lunge_2)
sc_play_sound(_snd, false)
sc_play_sound_element("element")
sc_play_sound_element("material")
