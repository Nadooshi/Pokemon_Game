/// @desc Init

// reload sprite
var _sp = asset_get_index("sp_pokeworld_" + string(pokemon_id.pokemon_map[? "face"]))
if sprite_exists(_sp)
	sprite_id = _sp

spr_drawn = [sprite_id, noone]

init = true
