/// @desc 

counter = ++counter mod 20

if counter = 0 {
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
		for (var i=0; i<ds_list_size(h_marks[t]); i++)
		if instance_exists(h_marks[t][| i])
			instance_destroy(h_marks[t][| i])
		ds_list_clear(h_marks[t])
					
		for (var i=0; i<ds_list_size(p_list_friendly) ; i++)
		with instance_create_layer(x, y, "Game", ob_hiding_mark) {
			parent_pokemon = p_list_friendly[| i]
			parent_cover = other.id
			index = i+1
			image_index = parent_pokemon.size
			ds_list_add(other.h_marks[t], id)
		}
		
		
		h_angle[t] = point_direction(p_list_enemy[| 0].x, p_list_enemy[| 0].y, x, y)
		var _ang = 0
		for (var i=1; i<ds_list_size(p_list_enemy); i++) {
			_ang = point_direction(p_list_enemy[| i].x, p_list_enemy[| i].y, x, y)
			h_angle[t] += angle_difference(_ang, h_angle[t]) * 0.5
		}
		for (var h=0; h<ds_list_size(p_list_friendly); h++) {
			h_marks[t][| h].x = x + lengthdir_x((h+1)*16, h_angle[t])
			h_marks[t][| h].y = y + lengthdir_y((h+1)*16, h_angle[t])
		}
	}

}
