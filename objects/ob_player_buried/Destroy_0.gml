/// @desc Revert

var _sp = asset_get_index("sp_pokeworld_" + string(pokemon_map[? "face"]))
if sprite_exists(_sp)
	sprite_index = _sp

maxSpeed = o_maxSpeed
position_stage = _ATTACK_TG.ground

sc_ai_give_up()
sc_player_stop_set()

if health_cur<=0
	event_perform_object(ob_player, ev_destroy, 0)
