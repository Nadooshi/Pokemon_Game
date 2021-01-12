/// @desc Init (Sort attacks)

for (var i=0; i<ds_list_size(action_list); i++) {
	switch action_list[|i ][? "type"] {
		case _ATTACK_TYPE.front:	
		case _ATTACK_TYPE.cloud:
		case _ATTACK_TYPE.melee: {
			ds_list_add(att_list[_ATTACK_PURPOSE.near], i)
			break
		}
		case _ATTACK_TYPE.mortar:
		case _ATTACK_TYPE.range:
		case _ATTACK_TYPE.ray:
		case _ATTACK_TYPE.wave: {
			ds_list_add(att_list[_ATTACK_PURPOSE.far], i)
			break
		}
		case _ATTACK_TYPE.aura:
		case _ATTACK_TYPE.pool: {
			ds_list_add(att_list[_ATTACK_PURPOSE.area], i)
		}
	
		case _ATTACK_TYPE.lunge:
		case _ATTACK_TYPE.swoop: {
			ds_list_add(att_list[_ATTACK_PURPOSE.move], i)
			break
		}
		case _ATTACK_TYPE.barrier: {
			ds_list_add(att_list[_ATTACK_PURPOSE.barrier], i)
			break
		}
	}
	// double purpose attacks
	switch action_list[| i][? "type"] {
		case _ATTACK_TYPE.pool: {
			ds_list_add(att_list[_ATTACK_PURPOSE.near], i)
			break
		}
		case _ATTACK_TYPE.cloud: {
			ds_list_add(att_list[_ATTACK_PURPOSE.far], i)
			ds_list_add(att_list[_ATTACK_PURPOSE.area], i)
			break
		}
	}
	
	
}

target = noone