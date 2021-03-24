/// @desc

// reload sprite
var _sp = asset_get_index("sp_pokeworld_" + string(pokemon_map[? "face"]))
if sprite_exists(_sp)
	sprite_index = _sp

sc_set_behaviour(sc_player_stop_set)

o_maxSpeed = maxSpeed
maxSpeed = 0
moveSpeed = 0
canMove = false
position_stage = _ATTACK_TG.ground
doActionNum = -1
attack_warmup = 0
target = noone
plannedActionNum = -1
power_reg = 0.2
health_reg = 0.3
hurt_reg = 0.3

image_index = 2
image_angle = choose(-90, 90)

alarm_set(2, 30)

