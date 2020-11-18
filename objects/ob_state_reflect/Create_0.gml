/// @desc

event_inherited()

image_index = _ABILITY_STATE.reflect;
period = 30
hit_count = 1
knockspeed = 8
knock_dir = 0

// state events
onDamage = function (_dmg, _damaged_player_id, _action) {
	// returns modified damage value
	_dmg = 0
	with _damaged_player_id {
		with instance_create_layer(x, y, "Particles", ob_particle_text)
			caption = "Reflect!"
		// every ob_bullet type should have its own code for this
		switch _action[? "type"]{
			case _ATTACK_TYPE.range:{
				with instance_create_layer(x, y+9, "Particles", ob_bullet_range){
					ds_map_copy(action, _action)
					pokemon_id = other.id
					hurt_time = _action[? "hurt_time"]
					timeout = 30 * 0.1 * _action[? "range"]
					damage_mod = other.damage_mod
					accuracy_mod = other.accuracy_mod
					direction = 180 - _action[? "dir"]
					image_angle = direction
					sprite_index = asset_get_index(_action[? "p_anim"])
					image_blend = sc_make_attack_colour(_action)
				}
				break;
			}
			case _ATTACK_TYPE.ray:{
				with instance_create_layer(x, y+9, "Particles", ob_bullet_ray) {
						ds_map_copy(action, _action)
						pokemon_id = other.id
						hurt_time = _action[? "hurt_time"]
						timeout = 30
						damage_mod = other.damage_mod
						accuracy_mod = other.accuracy_mod
						direction = 180 - _action[? "dir"]
						image_angle = direction
						sprite_index = asset_get_index(_action[? "p_anim"])
						image_blend = sc_make_attack_colour(_action)
				}
				break;
			}
			case _ATTACK_TYPE.wave:{
				with instance_create_layer(x, y+9, "Particles", ob_bullet_wave) {
					ds_map_copy(action, _action)
					pokemon_id = other.id
					hurt_time = _action[? "hurt_time"]
					timeout = 30 * 0.1 * _action[? "range"]
					damage_mod = other.damage_mod
					accuracy_mod = other.accuracy_mod
					direction = 180 - _action[? "dir"]
					image_angle = direction
					sprite_index = asset_get_index(_action[? "p_anim"])
					image_blend = sc_make_attack_colour(_action)
					if _action[? "range"] = 0
						d_size = 0
					else
						d_size = ((_action[? "radius"]) / timeout)					
				}
				break;
			}
		}
	}			
	return _dmg	
}
