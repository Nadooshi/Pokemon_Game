/// @desc Init

// Inherit the parent event
event_inherited();

if not instance_exists(pokemon_id)
	exit

	// create bullet
	bullet = instance_create_layer(x, y+9, "Particles", ob_bullet_ray)
	ds_map_copy(bullet.action, action)
	bullet.pokemon_id = pokemon_id
	bullet.hurt_time = hurt_time
	bullet.timeout = 30
	bullet.damage_mod = damage_mod
	bullet.accuracy_mod = accuracy_mod
	bullet.direction = pokemon_id.direction
	bullet.image_angle = bullet.direction
	bullet.sprite_index = asset_get_index(action[? "p_anim"])
	bullet.image_blend = sc_make_attack_colour(action)
	bullet.length = 1 * PixPerDist
	var _snd = choose(snd_attack_front_0, snd_attack_front_1, snd_attack_front_2)
	sc_play_sound(_snd, false)
	sc_play_sound_element("element")
	sc_play_sound_element("material")


//====================================================================================
/*
var _snd = choose(snd_attack_front_0, snd_attack_front_1, snd_attack_front_2)
sc_play_sound(_snd, false)
if sc_does_exist(pokemon_id.target) {
	if (point_distance(pokemon_id.x, pokemon_id.y+12, pokemon_id.target.x, pokemon_id.target.y+12)-12) < 8 +  pokemon_id.pokemon_map[? "size"] * 3
	if collision_line(x, y+12, pokemon_id.target.x, pokemon_id.target.y+12, pokemon_id.target, true, true) {
	
		bullet = instance_create_layer(pokemon_id.target.x, pokemon_id.target.y+12, "Particles", ob_damage_area)
		ds_map_copy(bullet.action, action)
		bullet.radius = 4
		bullet.pokemon_id = pokemon_id
		bullet.hurt_time = hurt_time
		bullet.damage_mod = damage_mod
		bullet.accuracy_mod = accuracy_mod
	
		sc_play_sound_element("element")
		sc_play_sound_element("material")
	}
}

*/
