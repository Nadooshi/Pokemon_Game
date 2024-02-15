/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

var _t = ds_map_find_value(action[? "active"], "state_time");
hit_count = _t * 2

alarm[0] = period;
damage = sc_calculate_formula(5, action[? "act_force"], action[? "pa_lvl"], action[? "act_force"], ds_map_find_value(action[? "active"], "state_value"), action[? "level"])
with pokemon_id{
	var _dmg = sc_calculate_numeric_damage(other.damage, id, other.action[? "element"],_MATERIAL.woody)
	health_cur = max(0, health_cur - _dmg)
	sc_hurt(0, other.pokemon_id_attack, other.action);
	sc_logging_state_loses(id, other.name, "trapped", "health", _dmg)
	instance_create_layer(x + random(20)-10, y + random(20)-10, "Particles", ob_particle_text, {
		caption : "-" + string(_dmg),
		image_blend : c_gray
	})
}

sc_logging_state_cursed(pokemon_id, name, "stuck on place")