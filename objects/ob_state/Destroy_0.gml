/// @desc 

if not instance_exists(pokemon_id) {
	show_debug_message("Id (" + string(pokemon_id) + ") doesn't exist logging has not been performed!")
	exit;
}

sc_logging_state_over(pokemon_id, name)
var i = ds_list_find_index(pokemon_id.states, id)
if i != -1
	ds_list_delete(pokemon_id.states, i);

for (var  i=0; i<ds_list_size(pokemon_id.states); i++)
with pokemon_id.states[| i]
	index = i
	