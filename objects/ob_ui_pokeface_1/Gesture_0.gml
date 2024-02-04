/// @desc 

// switch selection
var _map = noone
var _id = noone

with ob_ui_pokeface_1
if id != other.id
	selected = false

if sc_does_exist(list[| index], undefined, "'list[| index]' in Tap") {
	selected = not selected
	_map = list[| index]
	// find pokemon id with pokemon_map = _map
	with ob_player 
	if (_map = pokemon_map) {
		_id = id
		break
	}
	if selected_id != _id
		sc_set_selected(selected_id, false)	

	sc_set_selected(_id, selected)
}

sc_battle_update_actions()
with ob_ui_passiv
	event_perform(ev_other, ev_user0)
	
	
