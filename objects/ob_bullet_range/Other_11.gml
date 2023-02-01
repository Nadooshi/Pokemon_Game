/// @desc 

event_inherited();

if object_is_ancestor(collided_with.object_index, ob_player) {
	if sc_check_affect(pokemon_id, collided_with, action[? "affect"]) 
	if sc_check_accuracy(id, collided_with, action) {
		accuracy_done_for = collided_with
		instance_destroy()
	}
} else
	instance_destroy()
