/// @desc

layer_ids = [
	layer_get_id("Pokemons_Tiny"),
	layer_get_id("Pokemons_Normal"),
	layer_get_id("Pokemons_Big"),
	layer_get_id("Pokemons_Giant")
]
layer_coeffs = [
	0.005,
	0.01,
	0.03,
	0.05
]

layer_objs = []


var _frames = ds_map_create()
_frames[? ob_frame1] = ds_map_create()
for (var i=0; i<array_length(layer_ids); i++)
	_frames[? ob_frame1][? layer_ids[i]] = []
_frames[? ob_frame] = ds_map_create()
for (var i=0; i<array_length(layer_ids); i++)
	_frames[? ob_frame][? layer_ids[i]] = []

with ob_frame {
	_frames[? object_index][? layer][number] = id
	visible = false
}



var _c = ds_list_size(player1_trainer[? "active_pokemon_list"])
var _map = noone
var _l = 0
var _scale = 1
var _obj = noone
for (var i=0; i<_c; i++) {
	_map = player1_trainer[? "active_pokemon_list"][| i]
	_l = _map[? "size"]
	for (var j=0; j<array_length(_frames[? ob_frame1][? _l]); j++) {
		_obj = _frames[? ob_frame1][? _l][j]
		if instance_exists(_obj) {
			with instance_create_layer(_obj.x + _obj.sprite_width, _obj.y, _obj.layer, ob_versus_pokemon_face) {
				map = _map
				_scale = _obj.sprite_width / sprite_get_width(sprite_index)
				image_xscale = - _scale
				image_yscale = _scale
				event_perform(ev_other, ev_user0)
			}
			with _obj instance_destroy()
			break
		}
	}
}

var _c = ds_list_size(player2_trainer[? "active_pokemon_list"])
var _map = noone
var _l = 0
var _scale = 1
var _obj = noone
for (var i=0; i<_c; i++) {
	_map = player2_trainer[? "active_pokemon_list"][| i]
	_l = _map[? "size"]
	for (var j=0; j<array_length(_frames[? ob_frame][? _l]); j++) {
		_obj = _frames[? ob_frame][? _l][j]
		if instance_exists(_obj) {
			with instance_create_layer(_obj.x, _obj.y, _obj.layer, ob_versus_pokemon_face) {
				map = _map
				_scale = _obj.sprite_width / sprite_get_width(sprite_index)
				image_xscale = _scale
				image_yscale = _scale
				event_perform(ev_other, ev_user0)
			}
			with _obj instance_destroy()
			break
		}
	}
}

//with ob_frame1 {
//	_map = player1_trainer[? "active_pokemon_list"][| index]
//	if not is_undefined(_map)
//	if layer = other.layer_ids[_map[? "size"]]
//	with instance_create_layer(x, y, layer, ob_versus_pokemon_face) {
//		map = _map
//		parameter_name = "face"
//		_scale = other.sprite_width / sprite_get_width(sprite_index)
//		image_xscale = - _scale
//		image_yscale = _scale
//		event_perform(ev_other, ev_user0)
//	}
//}

//var _c = ds_list_size(player2_trainer[? "active_pokemon_list"])
//with ob_versus_pokemon_face2 {
//	visible = (index < _c)
//	if visible {
//		map = player2_trainer[? "active_pokemon_list"][| index]
//		layer_add_instance(other.layer_ids[map[? "size"]], id)
//		event_perform(ev_other, ev_user0)
//	}
//}

for (var i=0; i<array_length(layer_ids); i++) {
	layer_objs[i] = layer_get_all_elements(layer_ids[i])
	for (var j=0; j<array_length(layer_objs[i]); j++) {
		layer_objs[i][j] = layer_instance_get_instance(layer_objs[i][j])
		layer_objs[i][j]._oX = layer_objs[i][j].x
		layer_objs[i][j]._oY = layer_objs[i][j].y
	}
}

ds_map_destroy(_frames[? ob_frame1])
ds_map_destroy(_frames[? ob_frame])
ds_map_destroy(_frames)
