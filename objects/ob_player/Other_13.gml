/// @desc Attack

var _a_map = action_list[| doActionNum]
if not sc_does_exist(_a_map, undefined, "'_a_map' in User3") {
	doActionNum = -1
	exit
}

var _ok_position = ((_a_map[? "tgFrom"] & position_stage) != 0 )
var _ok_power = (_a_map[? "ap"] <= power_cur)

if _ok_position { 
	if _ok_power {
		power_cur -= _a_map[? "ap"]
		attack_warmup = _a_map[? "warmup"] + 0.001
		attack_error = _ATTACK_ERROR.nothing
	} else 
		attack_error = _ATTACK_ERROR.no_power
} else
	attack_error = _ATTACK_ERROR.wrong_position

if attack_error != _ATTACK_ERROR.nothing {
//	doActionNum = -1
	lastActionNum = -1
}

sc_battle_update_actions()
