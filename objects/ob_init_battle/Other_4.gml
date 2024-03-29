/// @desc Set AI player

var _start_area = instance_find(ob_start_area, 0)

var _list = player1_trainer[? "active_pokemon_list"]
player1_trainer[? "pokemon_ids"] = ds_list_create()
for (var i=0; i<ds_list_size(_list); i++) 
with sc_create_player(_list[| i], player1_trainer) {
	while not place_meeting(x, y, ob_start_area) {
		x = _start_area.bbox_left + random(_start_area.bbox_right  - _start_area.bbox_left)
		y = _start_area.bbox_top  + random(_start_area.bbox_bottom - _start_area.bbox_top )
	}
//=================================================================	
	sc_composed_add_component(cmp_control_ai, true)
//=================================================================	

	// set pokemon id for ob_pokeface
	with ob_ui_pokeface_1
	if index = i {
		pokemon_id = other.id
		break	
	}
	ds_list_add(player1_trainer[? "pokemon_ids"], id)
}

var _start_area = instance_find(ob_start_area, 1)

var _list = player2_trainer[? "active_pokemon_list"]
player2_trainer[? "pokemon_ids"] = ds_list_create()
for (var i=0; i<ds_list_size(_list); i++) 
with sc_create_player(_list[| i], player2_trainer) {
	while not place_meeting(x, y, ob_start_area) {
		x = _start_area.bbox_left + random(_start_area.bbox_right  - _start_area.bbox_left)
		y = _start_area.bbox_top  + random(_start_area.bbox_bottom - _start_area.bbox_top )
	}
	
//=================================================================	
	sc_composed_add_component(cmp_control_ai, true) // AI control
//=================================================================	


	// set pokemon id for ob_pokeface
	with ob_ui_pokeface_2
	if index = i {
		pokemon_id = other.id
		break	
	}
	ds_list_add(player2_trainer[? "pokemon_ids"], id)
}

with ob_ui_pokeface_1 
	list = player1_trainer[? "active_pokemon_list"]

with ob_ui_pokeface_2
	list = player2_trainer[? "active_pokemon_list"]

with ob_ui_pokeface
	event_perform(ev_other, ev_user0)

with ob_frame_inv 
	sc_group_ui_objects(id)
sc_battle_update_actions()

// start apply aura alarm
alarm[1] = frames_rate
