/// @desc

ob_face_evolve.visible = false

if not is_struct(evolution_tree[? current_pokemon[? "title"]])
	exit
	
var ev_poke = evolution_tree[? current_pokemon[? "title"]]
var _count = array_length(ev_poke.children)
var _step = backframe.sprite_width / 8
var _w = _step * (_count-1)
var _x = (backframe.x + (backframe.sprite_width - _w) * 0.5) - ob_face_evolve.sprite_width * 0.5
var _y = ob_face_evolve.y

for (var i=0; i<_count; i++)
with instance_create_layer(_x + _step*i, _y, "Elements", ob_face_evolve)
	index = i
checker.image_index = false // 0
var _lvlup_result = sc_lvlup_pokemon(current_pokemon[? "level"], current_pokemon[? "force"], current_pokemon[? "exp"])
if current_pokemon[? "level"] + 1 = ev_poke.maxlvl
if _lvlup_result.lvlup {
	checker.image_index = true
	with ob_face_evolve
		clicked = true
}

with evolve_parent
	map = current_pokemon
	
sc_refresh_ui()

