/// @desc 

event_inherited()

if instance_exists(bullet)
 	instance_destroy(bullet)
	
with pokemon_id 
	event_perform_object(ob_player_swoop, ev_destroy, 0)	// revert


