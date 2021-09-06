/// @desc Update hiding marks

near_players = []

var _d = 0.0
var _c = id
with ob_player {
	_d = distance_to_point(_c.x, _c.y+12)
	if _d <= _c.radius * 2 {
//		courage_cur = min(courage_cur+1, 100)
		array_push(_c.near_players, id)
	}
}

var _trainers = []
_trainers[0] = player1_trainer
_trainers[1] = player2_trainer

var p_list_friendly
var p_list_enemy
	
for (var t=0; t<2; t++) {
	p_list_friendly = _trainers[t][? "pokemon_ids"]
	p_list_enemy = _trainers[(t+1) mod 2][? "pokemon_ids"]

	if (ds_list_size(p_list_friendly) = 0) or
		(ds_list_size(p_list_enemy) = 0)
		break
			
	// clear hiding marks
	var _hmarks = h_marks[? _trainers[t]]
	var _hm = ds_map_find_first(_hmarks)
	while not is_undefined(_hm) {
		if instance_exists(_hmarks[? _hm])
			with _hmarks[? _hm] instance_destroy()
		_hm = ds_map_find_next(_hmarks, _hm)
	}
		
	ds_map_clear(_hmarks)
					
	for (var i=0; i<ds_list_size(p_list_friendly) ; i++) {
		// look at near players
		var _enemy_nearby = false
		for (var j=0; j<array_length(near_players); j++) {
			_enemy_nearby = (near_players[j].trainer != _trainers[t])
			if _enemy_nearby break
		}
		if not _enemy_nearby
		with instance_create_layer(x, y, "Game", ob_hiding_mark) {
			parent_pokemon = p_list_friendly[| i]
			parent_cover = other.id
			index = i+1
			image_index = parent_pokemon.size
			ds_map_add(_hmarks, p_list_friendly[| i], id)
		}
	}
	
	if not ds_map_empty(_hmarks) {
		var _h_angle = point_direction(p_list_enemy[| 0].x, p_list_enemy[| 0].y, x, y)
		var _ang = 0
		for (var i=1; i<ds_list_size(p_list_enemy); i++) {
			_ang = point_direction(p_list_enemy[| i].x, p_list_enemy[| i].y, x, y)
			_h_angle += angle_difference(_ang, _h_angle) * 0.5
		}
		var _hm = ds_map_find_first(_hmarks)
		while not is_undefined(_hm) {
			_hmarks[? _hm].x = x + lengthdir_x(_hmarks[? _hm].index * 16, _h_angle)
			_hmarks[? _hm].y = y + lengthdir_y(_hmarks[? _hm].index * 16, _h_angle)
			_hm = ds_map_find_next(_hmarks, _hm)
		}
	}
	
//	for (var h=0; h<ds_list_size(p_list_friendly); h++) {
//		_hmarks[? p_list_friendly[| h]].x = x + lengthdir_x((h+1)*16, h_angle[t])
//		_hmarks[? p_list_friendly[| h]].y = y + lengthdir_y((h+1)*16, h_angle[t])
//	}
}

alarm_set(0, 20)
