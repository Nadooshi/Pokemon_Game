/// @desc 
function sc_new_action() {

	var result = ds_map_create()

	result[? "name"			] = ""
	result[? "type"			] = _ATTACK_TYPE.melee
	result[? "bullet_phys"	] = _BULLET_PH.custom
	result[? "affect"		] = _ATTACK_AFFECT.enemy  // combination of _ATTACK_AFFECT
	result[? "range"		] =	0
	result[? "level"		] =	0
	result[? "exp"			] = 0 // global experience
	result[? "battle_exp"	] = 0 // in battle exp
	result[? "act_force"	] =	_FORCE.preferred
	result[? "radius"		] = 0
	result[? "warmup"		] = 0
	result[? "delay"		] =	0
	result[? "accuracy"		] = 0
	result[? "ap"			] = 0
	result[? "damage"		] = 0
	result[? "dmg_element"	] = 0
	result[? "dmg_material"	] = 0
	result[? "element"		] = _ELEMENTAL.none
	result[? "material"		] = _MATERIAL.none
	result[? "repeatable"	] = true
	result[? "tgFrom"		] = _ATTACK_TG.ground   // combination of _ATTACK_TG 
	result[? "tgTo"			] = _ATTACK_TG.ground   // combination of _ATTACK_TG 
	result[? "anim"			] = ""    // name of sprite asset ("sp_..")
	result[? "p_anim"		] = ""    // name of sprite asset ("sp_..")
	result[? "ex_anim"		] = ""    // name of sprite asset ("sp_..")

	result[? "active"		] = ""    // map of ability
	
	result[? "rating"		] = 0	// rating action 0-5. Over 5 not recommend
	result[? "role"			] = _ATTACK_ROLE.debuff

	return result



}
