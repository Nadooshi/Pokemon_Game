/// @desc  Edit
// map = trainer

current_pokemon = ds_list_find_value(map[? parameter_name], index)
if not sc_does_exist(current_pokemon)
	exit;

with ob_frame_pokemon {
	map = current_pokemon
	visible = true
	event_perform(ev_other, ev_user0)
}

sc_endbattle_refresh_actions()

