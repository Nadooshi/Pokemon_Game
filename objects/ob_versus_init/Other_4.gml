/// @desc

// by _SIZE

layer_coeffs = [
	0.005,
	0.01,
	0.03,
	0.05
]

frames = ds_map_create()
var _frames = frames

with ob_frame { // index in ob_frame here is layer_id
	if is_undefined(_frames[? object_index])
		_frames[? object_index] = ds_map_create()
	if is_undefined(_frames[? object_index][? size])
		_frames[? object_index][? size] = array_create(6, noone)
	_frames[? object_index][? size][number] = id
	visible = false
}

var _c = ds_list_size(player1_trainer[? "active_pokemon_list"])
var _map = noone
var _sz = 0
var _scale = 1
var _obj = noone
for (var i=0; i<_c; i++) {
	_map = player1_trainer[? "active_pokemon_list"][| i]
	_sz = _map[? "size"]
	_obj = frames[? ob_frame1][? _sz][i]
	if instance_exists(_obj) {
		with instance_create_layer(_obj.x + _obj.sprite_width, _obj.y, _obj.layer, ob_versus_pokemon_face) {
			map = _map
			_scale = _obj.sprite_width / sprite_get_width(sprite_index)
			image_xscale = - _scale
			image_yscale = _scale
			event_perform(ev_other, ev_user0)
			_frames[? ob_frame1][? _sz][i] = id
			_oX = x
			_oY = y
		}
	}
}

var _c = ds_list_size(player2_trainer[? "active_pokemon_list"])
var _map = noone
var _sz = 0
var _scale = 1
for (var i=0; i<_c; i++) {
	_map = player2_trainer[? "active_pokemon_list"][| i]
	_sz = _map[? "size"]
	_obj = frames[? ob_frame][? _sz][i]
	if instance_exists(_obj) {
		with instance_create_layer(_obj.x, _obj.y, _obj.layer, ob_versus_pokemon_face) {
			map = _map
			_scale = _obj.sprite_width / sprite_get_width(sprite_index)
			image_xscale = _scale
			image_yscale = _scale
			event_perform(ev_other, ev_user0)
			_frames[? ob_frame][? _sz][i] = id
			_oX = x
			_oY = y
		}
	}
}

with ob_frame
	instance_destroy()
	
for (var sz = _SIZE.tiny; sz < _SIZE.immobile; sz++) {
	var m = ds_map_find_first(frames)
	while not is_undefined(m) {
		for (var j=0; j<array_length(frames[? m][? sz]); j++)
		if not instance_exists(frames[? m][? sz][j]) {
			array_delete(frames[? m][? sz], j, 1)
			j--
			continue
		}
		m = ds_map_find_next(frames, m)
	}
}



