/// @desc Revert

instance_change(ob_player, false)

var _sp = asset_get_index("sp_pokeworld_" + string(pokemon_map[? "face"]))
if sprite_exists(_sp)
	sprite_index = _sp

maxSpeed = o_maxSpeed
canMove = true
sc_player_stop_set()

image_angle = 0

if health_cur<=0
	event_perform_object(ob_player, ev_destroy, 0)
