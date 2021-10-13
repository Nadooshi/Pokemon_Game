/// @desc

map = current_trainer[? "active_pokemon_list"][| index]

if is_undefined(map) {
	instance_destroy()
	exit
}

event_perform(ev_other, ev_user0)

