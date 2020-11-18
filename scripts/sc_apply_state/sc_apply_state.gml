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
			if _st.name = _name
				return false
		}

		if not sc_state_check_compatible(_action)
			return false
	
		// create state instance
		var _state_inst = instance_create_layer(x, y, "Particles", _state_obj)
		with _state_inst {
			damage = _dmg
			index = ds_list_size(other.states)
			pokemon_id = other.id;
			pokemon_id_attack = _pokemon_id_attack; // атакующий
			if not is_undefined(_action)
			if ds_exists(_action, ds_type_map) {
				name = ds_map_find_value(_action[? "active"], "name");
				ds_map_copy(action, _action);
			}
		}
		ds_list_add(states, _state_inst)
	
	}

	return true

}
