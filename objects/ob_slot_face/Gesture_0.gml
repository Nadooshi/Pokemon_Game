/// @desc  Edit
// map = triner

event_inherited()

current_pokemon = ds_list_find_value(map[? parameter_name], index)
if sc_does_exist(current_pokemon) {
	sc_refresh_actions()

	room_height = max(1080, 16 + 96 * ds_map_size(current_pokemon[? "actions"]))
	sc_switch_view_actions()
} else
with ob_backpack
	event_perform(ev_gesture, ev_gesture_tap)

