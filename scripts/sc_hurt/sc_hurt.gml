/// @arg damage
function sc_hurt(argument0) {

	// for ob_pokemon

	var _dmg = argument0;

	health_cur = max(0, health_cur - _dmg)
	hurt_cur += _dmg

	// death
	if health_cur = 0 
		event_perform(ev_destroy, 0)
	
	with instance_create_layer(x + random(20)-10, y + random(20)-10, "Particles", ob_particle_text) {
		caption = "-" + string(_dmg)
		blend_mode = bm_add
		image_blend = c_red
	}



}
