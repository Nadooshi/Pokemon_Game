/// @desc Teleport

sc_set_behaviour(sc_player_stop_set)

instance_deactivate_object(id)
with instance_create_layer(x, y, "Game", ob_player_teleport_start) {
	pokemon_id = other.id
}

