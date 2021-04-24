/// @desc Calculate state pos

if not instance_exists(pokemon_id)
	exit
	
if ds_exists(pokemon_id.states, ds_type_list) {
	states_w = (ds_list_size(pokemon_id.states)-1) * (sprite_get_width(sp_state) * 0.15)*0.5
	states_y = y - sprite_height * 0.5;
}

var _c = ""
with pokemon_id 
if ds_list_find_index(component_list, cmp_control_ai) {
	var _action = action_list[| plannedActionNum] 
	if not is_undefined(_action)
		_c = _action[? "name"]
	else
		_c = " .zZ !!!11"
}

caption = _c
