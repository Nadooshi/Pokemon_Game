/// @desc 

if not init 
	event_perform(ev_other, ev_user0)

event_inherited()

if not instance_exists(pokemon_id) or anim_ended {
	with pokemon_id
		sc_canMove(true)
	instance_destroy()
}
