/// @desc

exit;

sc_clear_trainer(trainer_preset)
sc_clear_trainer(current_trainer)

ds_map_destroy(pokemon_list)
sc_clear_pokemon(current_pokemon)

sc_clear_trainer(player1_trainer)
sc_clear_trainer(player2_trainer)
ds_map_destroy(evolution_tree)

part_system_destroy(part_system_wind)