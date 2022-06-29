/// @desc

if not is_struct(evolution_tree[? current_pokemon[? "title"]])
	exit
if array_length(evolution_tree[? current_pokemon[? "title"]].children) = 0
	exit
	
var _childname = evolution_tree[? current_pokemon[? "title"]].children[index]

var _p = ds_map_create()
sc_load_pokemon_dex(_childname, _p)
image_index = _p[? "face"] + 0.01
image_xscale = 0.5
image_yscale = 0.5

hint = _childname

sc_clear_pokemon(_p)
