/// @arg damage
/// @arg iniciator_id
/// @arg action_map
function sc_hurt(argument0, argument1, argument2) {

// for ob_pokemon (recipient)

var _dmg = argument0
var _p_attack = argument1
var _action = argument2

// ==========================================================================
health_cur = max(0, health_cur - _dmg)
hurt_cur += _dmg
//===========================================================================

// death
if health_cur = 0 {
	if trainer > -1 {
		if not is_undefined(_action)
			sc_logging_death(_p_attack, id, _action)
		if trainer != _p_attack.trainer {
			_p_attack.frags++
			sc_gain_exp(_p_attack, poke_exp.kill, pokemon_map, string(_p_attack.pokemon_map[?"title"]) + " made " + string(_p_attack.frags) + " frags!")
		}
	}
	event_perform(ev_destroy, 0)
}
	
if _dmg > 0
instance_create_layer(x + random(20)-10, y + random(20)-10, "Particles", ob_particle_text, {
	caption : "-" + string(_dmg),
	image_blend : c_white,
	xy_scale : 0.3
})

if ds_exists(_action, ds_type_map) {
	var sprites = array_create(2)
	sprites[0] = asset_get_index("sp_explode_elemental" + string(_action[? "element"]))
	sprites[1] = asset_get_index("sp_explode_elemental" + string(_action[? "material"]))
	sc_particle_fx_explode(x, y, sprites, 5, 1, 0.5, 1)
}


}
