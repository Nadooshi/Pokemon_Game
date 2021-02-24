/// @desc 

keys[k._count] = false
keys_before[k._count] = false

prev_doMove = false

dirangle[d.Left ] = 180
dirangle[d.Right] = 0
dirangle[d.Up   ] = 90
dirangle[d.Down ] = 270

counter = 0
scBehaviour = sc_ai_idle
prev_behaviour = sc_ai_idle

enum _ATTACK_PURPOSE {
	near,
	far,
	area,
	barrier,
	support,
	move,
	count
}

plannedPurpose = -1
plannedActionNum = -1
//neededDist = 32  // min dist for chosen attack
last_done = false  // last attack was successful

att_list = array_create(_ATTACK_PURPOSE.count, noone) // actionNums

if not ds_exists(att_list[_ATTACK_PURPOSE.near], ds_type_list)
	att_list[_ATTACK_PURPOSE.near] = ds_list_create()
if not ds_exists(att_list[_ATTACK_PURPOSE.far], ds_type_list)
	att_list[_ATTACK_PURPOSE.far] = ds_list_create()
if not ds_exists(att_list[_ATTACK_PURPOSE.area], ds_type_list)
	att_list[_ATTACK_PURPOSE.area] = ds_list_create()
if not ds_exists(att_list[_ATTACK_PURPOSE.move], ds_type_list)
	att_list[_ATTACK_PURPOSE.move] = ds_list_create()

if not ds_exists(att_list[_ATTACK_PURPOSE.barrier], ds_type_list)
	att_list[_ATTACK_PURPOSE.barrier] = ds_list_create()

//if not ds_exists(att_list[_ATTACK_PURPOSE.support], ds_type_list)
//	att_list[_ATTACK_PURPOSE.support] = ds_list_create()

scBehaviour = sc_player_stop_set

ai_groups = ds_map_create()


