/// @desc  Edit
// map = trainer

current_pokemon = ds_list_find_value(map[? parameter_name], index)

with ob_frame_pokemon {
	map = current_pokemon
	visible = true
	event_perform(ev_other, ev_user0)
}

//sc_endbattle_refresh_actions()

if sc_does_exist(current_pokemon, undefined, "'current_pokemon' in Tap") {
	sc_refresh_actions()

	room_height = max(1080, 16 + 96 * ds_map_size(current_pokemon[? "actions"]))
	sc_switch_view_actions()
} else
with ob_backpack
	event_perform(ev_gesture, ev_gesture_tap)

