/// @desc 

event_inherited()
if not instance_exists(pokemon_id) 
	instance_destroy()

if anim_ended {
	with pokemon_id
		sc_canMove(true)
	instance_destroy()
}
