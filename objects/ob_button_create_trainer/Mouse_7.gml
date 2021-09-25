/// @desc

// Inherit the parent event
event_inherited();

if is_undefined(trainer_preset[? "name"]) or trainer_preset[? "name"] = ""
	trainer_preset[? "name"] = "Newbie"

ds_map_copy(current_trainer, trainer_preset)


var _name	 = ds_map_find_first(pokemon_list)
for (var n=0; n<pokemon_list_count; n++) {
	ds_list_add(current_trainer[? "caught_pokemon_list"], sc_load_new_pokemon(_name))
	_name = ds_map_find_next(pokemon_list, _name)
}
ds_list_shuffle(current_trainer[? "caught_pokemon_list"])

for (var n=0; n<ds_list_size(current_trainer[? "caught_pokemon_list"]); n++)
	ds_list_mark_as_map(current_trainer[? "caught_pokemon_list"], n)

sc_save_trainer()


sc_clear_trainer(player1_trainer); player1_trainer = noone
sc_clear_trainer(player2_trainer); player2_trainer = noone

room_restart()
