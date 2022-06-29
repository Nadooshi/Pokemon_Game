/// @desc apply evolve
if not clicked
	exit;
	
event_inherited();
var temp_pokemon = ds_map_create()
temp_pokemon = sc_load_new_pokemon(evolution_tree[? current_pokemon[? "title"]].children[index])

temp_pokemon[? "exp"] = current_pokemon[? "exp"]
temp_pokemon[? "level"] = current_pokemon[? "level"]
temp_pokemon[? "loses"] = current_pokemon[? "loses"]
temp_pokemon[? "wins"] = current_pokemon[? "wins"]
//temp_pokemon[? "artefact"] = noone
//temp_pokemon[? "berry"] = noone
//temp_pokemon[? "potion"] = noone

var _a = ds_map_find_first(current_pokemon[? "actions"])
while not is_undefined(_a) {
	if not is_undefined(temp_pokemon[? "actions"][? _a])
		ds_map_copy(temp_pokemon[? "actions"][? _a], current_pokemon[? "actions"][?_a])
	_a = ds_map_find_next(current_pokemon[? "actions"], _a)
}

for (var i = 0; i < ds_list_size(current_pokemon[? "active_actions"]); i++){
	var _a = ds_map_find_first(temp_pokemon[? "actions"])
	while not is_undefined(_a){
		if _a = current_pokemon[? "active_actions"][| i]{
			ds_list_set(temp_pokemon[? "active_actions"], i, _a)
			break;
		}
		_a = ds_map_find_next(temp_pokemon[? "actions"], _a)
	}
}

ds_list_add(current_trainer[? "caught_pokemon_list"], temp_pokemon)
ds_list_mark_as_map(current_trainer[? "caught_pokemon_list"], ds_list_size(current_trainer[? "caught_pokemon_list"])-1)


var _s = ds_list_size(current_trainer[? "active_pokemon_list"])
for (var i = 0; i < _s; i++)
	if current_trainer[? "active_pokemon_list"][| i][? "title"] = current_pokemon[? "title"]{
		current_trainer[? "active_pokemon_list"][| i] = temp_pokemon
		var _id = i
		break;
	}

current_pokemon = current_trainer[? "active_pokemon_list"][| _id]

room_goto(rm_endbattle)

