/// @arg damage
/// @arg iniciator_id
/// @arg action_map
function sc_hurt(argument0, argument1, argument2) {

	// for ob_pokemon (recipient)

	var _dmg = argument0
	var _p_attack = argument1
	var _action = argument2
	

	health_cur = max(0, health_cur - _dmg)
	hurt_cur += _dmg

	// death
	if health_cur = 0 {
		if not is_undefined(_action)
			sc_logging_death(_p_attack, id, _action)
		event_perform(ev_destroy, 0)
	}
	
	with instance_create_layer(x + random(20)-10, y + random(20)-10, "Particles", ob_particle_text) {
		caption = "-" + string(_dmg)
		//blend_mode = bm_add
		image_blend = c_red
	}



}
