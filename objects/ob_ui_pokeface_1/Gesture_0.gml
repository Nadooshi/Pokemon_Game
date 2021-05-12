/// @desc 

// switch selection
var _map_id = noone

with ob_ui_pokeface_1
if id != other.id
	selected = false

if sc_does_exist(list[| index]) {
	selected_id = noone
	selected = not selected
	_map_id = list[| index]
	with ob_player {
		selected = (_map_id = pokemon_map) && other.selected
		if selected {
			selected_id = id
			sc_composed_remove_component(cmp_control_ai)
//			sc_composed_add_component(cmp_control_keyb, true)
			sc_composed_add_component(cmp_control_touch, true)
			doActionNum = -1
			target = noone
		} else {
//			sc_composed_remove_component(cmp_control_keyb)
			sc_composed_remove_component(cmp_control_touch)
			if sc_composed_add_component(cmp_control_ai) {
				doActionNum = -1
				target = noone
				sc_player_stop_set()
				sc_set_behaviour(sc_player_stop_set)
			}
		}
	}
}

sc_battle_update_actions()
 