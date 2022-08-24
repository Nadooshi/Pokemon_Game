/// @desc 

if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}

alarm[0] = period;
pokemon_id.shield = 0

sc_logging_state_cursed(pokemon_id, name, "loses all defence ability")


