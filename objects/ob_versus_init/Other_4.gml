/// @desc

layer_ids = [
	layer_get_id("Pokemons_Tiny"),
	layer_get_id("Pokemons_Normal"),
	layer_get_id("Pokemons_Big"),
	layer_get_id("Pokemons_Giant")
]
layer_coeffs = [
	0.05,
	0.075,
	0.1,
	0.2
]

layer_objs = []

var _c = ds_list_size(player1_trainer[? "active_pokemon_list"])
with ob_versus_pokemon_face {
	visible = (index < _c)
	if visible {
		map = player1_trainer[? "active_pokemon_list"][| index]
		layer_add_instance(other.layer_ids[map[? "size"]], id)
		event_perform(ev_other, ev_user0)
	}
}

var _c = ds_list_size(player2_trainer[? "active_pokemon_list"])
with ob_versus_pokemon_face2 {
	visible = (index < _c)
	if visible {
		map = player2_trainer[? "active_pokemon_list"][| index]
		layer_add_instance(other.layer_ids[map[? "size"]], id)
		event_perform(ev_other, ev_user0)
	}
}

for (var i=0; i<array_length(layer_ids); i++) {
	layer_objs[i] = layer_get_all_elements(layer_ids[i])
	for (var j=0; j<array_length(layer_objs[i]); j++) {
		layer_objs[i][j] = layer_instance_get_instance(layer_objs[i][j])
		layer_objs[i][j]._oX = layer_objs[i][j].x
		layer_objs[i][j]._oY = layer_objs[i][j].y
	}
}
