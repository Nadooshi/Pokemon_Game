/// @desc 

if not init 
	event_perform(ev_other, ev_user0)

event_perform_object(ob_composed, ev_step, ev_step_normal)

if not instance_exists(pokemon_id) or anim_ended {
	with pokemon_id
		sc_canMove(true)
	instance_destroy()
	exit
}

if not shot_done {
	shot_done = true
	// create bullet
	bullet = instance_create_layer(x, y+9, "Particles", ob_bullet_range)
	ds_map_copy(bullet.action, action)
	bullet.pokemon_id = pokemon_id
	bullet.hurt_time = hurt_time
	bullet.timeout = 60 * 0.1 * action[? "range"]
	bullet.damage_mod = damage_mod
	bullet.accuracy_mod = accuracy_mod
	bullet.direction = pokemon_id.direction
	bullet.image_angle = bullet.direction
	bullet.sprite_index = asset_get_index(action[? "p_anim"])
	bullet.image_blend = sc_make_attack_colour(action)
	with bullet
	sc_set_coll_areas(
		(action[? "tgTo"] & _ATTACK_TG.ground) > 0,
		(action[? "tgTo"] & _ATTACK_TG.air) > 0,
		(action[? "tgTo"] & _ATTACK_TG.underground) > 0
	)
	var _snd = choose(snd_attack_range_0, snd_attack_range_1, snd_attack_range_2)
	sc_play_sound(_snd, false)
	sc_play_sound_element("element")
	sc_play_sound_element("material")
}
