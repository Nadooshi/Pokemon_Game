/// @desc Check if compatible

with pokemon_id
if not sc_state_check_compatible(other.action)
	instance_destroy(other.id)
	
