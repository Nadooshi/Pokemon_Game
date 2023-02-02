/// @desc Init

// Inherit the parent event
event_inherited();

for (var i=0; i<dot_count; i++) {
	dot[i] = instance_create_layer(x, y, "Particles", ob_pivot)
	with dot[i] {
		//ds_map_copy(action, other.action)
		action = other.action
		accuracy_done_for = other.accuracy_done_for
		list_missed = other.list_missed
		action[? "dmg_element"] = other.action[? "dmg_element"] / 5
		action[? "dmg_material"] = other.action[? "dmg_material"] / 5
		pokemon_id = other.pokemon_id
		hurt_time = other.hurt_time
		sc_set_coll_areas(
			(action[? "tgTo"] & _ATTACK_TG.ground) > 0,
			(action[? "tgTo"] & _ATTACK_TG.air) > 0,
			(action[? "tgTo"] & _ATTACK_TG.underground) > 0
		)
	}
}
