/// @desc Update

var _lvlup_result = sc_lvlup_pokemon(map[? "level"], map[? "force"], map[? "exp"])

newexp = _lvlup_result.exceeding_exp
visible = _lvlup_result.lvlup

map[? "nextlvl_exp"] = _lvlup_result.nextlvl_exp


