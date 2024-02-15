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

fail_count = 0
#macro max_fails 7


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

if not variable_instance_exists(id, "att_list")
	att_list = array_create(_ATTACK_PURPOSE.count, noone) // actionNums
if not variable_instance_exists(id, "att_tgFroms") {
	att_tgFroms[_ATTACK_TG.air] = noone
	att_tgFroms[_ATTACK_TG.ground] = noone
	att_tgFroms[_ATTACK_TG.underground] = noone
}

for (var i=0; i<_ATTACK_PURPOSE.count; i++)
if not ds_exists(att_list[i], ds_type_list)
	att_list[i] = ds_list_create()

if not ds_exists(att_tgFroms[_ATTACK_TG.air], ds_type_list)
	att_tgFroms[_ATTACK_TG.air] = ds_list_create()
if not ds_exists(att_tgFroms[_ATTACK_TG.ground], ds_type_list)
	att_tgFroms[_ATTACK_TG.ground] = ds_list_create()
if not ds_exists(att_tgFroms[_ATTACK_TG.underground], ds_type_list)
	att_tgFroms[_ATTACK_TG.underground] = ds_list_create()

//if not ds_exists(att_list[_ATTACK_PURPOSE.support], ds_type_list)
//	att_list[_ATTACK_PURPOSE.support] = ds_list_create()

scBehaviour = sc_player_stop_set

ai_groups = ds_map_create()
