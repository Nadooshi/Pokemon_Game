/// @desc

ds_map_destroy(ai_groups)
for (var i=0; i<_ATTACK_PURPOSE.count; i++) {
	if not ds_exists(att_list[i], ds_type_list)
		ds_list_destroy(att_list[i])
}

if not ds_exists(att_tgFroms[_ATTACK_TG.air], ds_type_list)
	ds_list_destroy(att_tgFroms[_ATTACK_TG.air])
if not ds_exists(att_tgFroms[_ATTACK_TG.ground], ds_type_list)
	ds_list_destroy(att_tgFroms[_ATTACK_TG.ground])
if not ds_exists(att_tgFroms[_ATTACK_TG.underground], ds_type_list)
	ds_list_destroy(att_tgFroms[_ATTACK_TG.underground])
	