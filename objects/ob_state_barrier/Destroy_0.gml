/// @desc

// Inherit the parent event
event_inherited();
if instance_exists(pokemon_id)
	exit;

for (var i=0; i<ds_list_size(pokemon_id.states); i++)
if pokemon_id.states[| i].id != noone
if pokemon_id.states[| i].id = id 
	pokemon_id.shield = max(0, pokemon_id.shield - val)
else
	pokemon_id.shield = 0

sc_logging_info("Now "+ pokemon_id.pokemon_map[? "title"] +"is value of: " + string(pokemon_id.shield))
