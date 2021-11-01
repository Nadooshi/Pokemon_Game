//@desc returns new exp value or <0 if no lvlup
function sc_lvlup_action(lvl, power, cur_exp){

#macro base_lvlup_value_action 1200

var _result = -1
var lvlup_max_exp = base_lvlup_value_action * lvl * coef_lvlup[power]
//if cur_exp >= lvlup_max_exp
_result = cur_exp - lvlup_max_exp

return {
	lvlup: _result > 0,
	exceeding_exp: _result,
	nextlvl_exp: lvlup_max_exp
}

}


