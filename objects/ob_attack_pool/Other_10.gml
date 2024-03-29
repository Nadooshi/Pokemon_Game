/// @desc Init

// Inherit the parent event
event_inherited();

var _dx = x + lengthdir_x(pokemon_id.pokemon_map[? "size"] * 3 + PixPerDist, direction)
var _dy = y + lengthdir_y(pokemon_id.pokemon_map[? "size"] * 2 + PixPerDist, direction)

with instance_create_layer(_dx, _dy, "Particles", ob_bullet_pool) {
	ds_map_copy(action, other.action)
	radius = (action[? "radius"] + 1) * 8
	pokemon_id = other.pokemon_id
	hurt_time = other.hurt_time
	timeout = action[? "range"] * frames_rate
	damage_mod = other.damage_mod
	accuracy_mod = other.accuracy_mod

	sprite_index = asset_get_index(action[? "p_anim"])
	image_blend = sc_make_attack_colour(action)
	
	var _snd = choose(snd_attack_pool_0, snd_attack_pool_1, snd_attack_pool_2)
	sc_play_sound(_snd, false)
	sc_play_sound_element("element")
	sc_play_sound_element("material")

}
