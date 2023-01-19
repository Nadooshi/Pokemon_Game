/// @desc 

event_inherited();

if sc_check_affect(pokemon_id, collided_with, action[? "affect"]) 
if sc_check_accuracy(id, collided_with, action) {
	accuracy_done_for = collided_with
	instance_destroy()
}


// bullet get stuck inside ob_collide of shooting pokemon. 
// solid = false. exclude pokemon's ob_collide from collision somehow (accuracy_done_for?)
