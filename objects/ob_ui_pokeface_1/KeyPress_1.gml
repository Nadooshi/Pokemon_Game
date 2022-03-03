/// @desc 

// switch selection
var _i = keyboard_key-49
if not (_i>=0 and _i<=5) exit

var _map_id = noone


if sc_does_exist(list[| _i]) {
	selected = (_i = index)
	_map_id = list[| index]
	if selected 
	with ob_player {
		selected = (_map_id = pokemon_map)
		if selected {
			// reset cmp_control
			if instance_exists(selected_id)
			with selected_id {
				sc_composed_remove_component(cmp_control_keyb)
				sc_composed_add_component(cmp_control_ai)
				control_component = cmp_control_ai
			}
			selected_id = id
			
			sc_battle_update_actions()
			// switch cmp_control
			sc_composed_remove_component(cmp_control_ai)
			sc_composed_add_component(cmp_control_keyb, true)
			control_component = cmp_control_keyb

			doActionNum = -1
		}
	}	
}

 