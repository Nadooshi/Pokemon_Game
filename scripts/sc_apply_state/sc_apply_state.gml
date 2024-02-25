/// @arg state_obj
/// @arg damage
/// @arg pokemon_attack
/// @arg action
function sc_apply_state() {

	/// Наложение
	/// for ob_pokemon

	var _state_obj = argument[0]
	var _dmg = argument[1]
	var _pokemon_id_attack = argument[2]
	var _action = undefined

	if argument_count > 3
		_action = argument[3]
	
	if ds_exists(states, ds_type_list) {
		// check duplicate
		var _st
		var _name = ds_map_find_value(_action[? "active"], "name") 
		for (var i=0; i<ds_list_size(states); i++) {
			_st = ds_list_find_value(states, i)
			if instance_exists(_st) 
			if _st.name = _name {
				//return false
				var _t = _action[? "active"][? "state_time"]
				switch _action[? "active"][? "state"] {
					case _ABILITY_STATE.barrier:
					case _ABILITY_STATE.bleed:
					case _ABILITY_STATE.block:
					case _ABILITY_STATE.burn:
					case _ABILITY_STATE.clear:
					case _ABILITY_STATE.confidence:
					case _ABILITY_STATE.confusion:
					case _ABILITY_STATE.cure:
					case _ABILITY_STATE.dextery:
					case _ABILITY_STATE.disgust:
					case _ABILITY_STATE.heal:
					case _ABILITY_STATE.incineration:
					case _ABILITY_STATE.leech:
					case _ABILITY_STATE.loser:
					case _ABILITY_STATE.medicine:
					case _ABILITY_STATE.meleeup:
					case _ABILITY_STATE.poison:
					case _ABILITY_STATE.powerup:
					case _ABILITY_STATE.rangeup:
					case _ABILITY_STATE.reflect:
					case _ABILITY_STATE.slowdown:
					case _ABILITY_STATE.speedup:
					case _ABILITY_STATE.stun:
					case _ABILITY_STATE.target:
					case _ABILITY_STATE.terror:
					case _ABILITY_STATE.weak:{
						_st.hit_count = min(_st.hit_count + _t, _t * 2)
						return false
					}
					case _ABILITY_STATE.blast:
					case _ABILITY_STATE.flee:
					case _ABILITY_STATE.kamikaze:
					case _ABILITY_STATE.knockdown:
					case _ABILITY_STATE.lulling:
					case _ABILITY_STATE.mindcontrol:
					case _ABILITY_STATE.mutual:
					case _ABILITY_STATE.paralyze:
					case _ABILITY_STATE.random_x:
					case _ABILITY_STATE.revenge:
					case _ABILITY_STATE.telekinesis:
					case _ABILITY_STATE.teleport:
					case _ABILITY_STATE.trap:
					case _ABILITY_STATE.wastetime:
					case _ABILITY_STATE.wreck:
						return false
				}
			}
		}

		if not sc_state_check_compatible_biome(_action) {
			instance_create_layer(x, y, "Particles", ob_particle_text, {
				caption : "X "+_action[? "active"][? "name"] + " X (!BIOME)"
			})
			return false
		}
		if not sc_state_check_compatible(_action) {
			instance_create_layer(x, y, "Particles", ob_particle_text, {
				caption : "X "+_action[? "active"][? "name"] + " X (!STATE)"
			})
			return false
		}
	
		// create state instance
		var _state_inst = instance_create_layer(x, y, "Particles", _state_obj)
		with _state_inst {
			damage = _dmg
			index = ds_list_size(other.states)
			pokemon_id = other.id;
			if is_undefined(_action[? "lastX"]) or is_undefined(_action[? "lastY"]) {
				_action[? "lastX"] = x
				_action[? "lastY"] = y
			}
			
			pokemon_id_attack = _pokemon_id_attack; // атакующий
			if not is_undefined(_action)
			if ds_exists(_action, ds_type_map) {
				name = ds_map_find_value(_action[? "active"], "name");
				action = ds_map_create() // без этой строчки происходят неведовые вещи. Вылетает из-за пустого action
				ds_map_copy(action, _action);
				if is_undefined(_action[? "lvlup_mod"])
					ds_map_add(_action, "lvlup_mod", 0)
			}
		}
		ds_list_add(states, _state_inst)
	
	}

	return true

}
