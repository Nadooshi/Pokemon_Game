//@desc returns new exp value or <0 if no lvlup
function sc_lvlup_pokemon(lvl, power, cur_exp){

#macro base_lvlup_value 300

var _result = -1
var lvlup_max_exp = base_lvlup_value * lvl * coef_lvlup[power]
//if cur_exp >= lvlup_max_exp
_result = cur_exp - lvlup_max_exp

return _result

}


