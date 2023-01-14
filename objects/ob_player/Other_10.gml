/// @desc Init

event_inherited()

//mask_index = sp_shadow_path

sc_set_coll_areas(
	position_stage == _ATTACK_TG.ground,
	position_stage == _ATTACK_TG.air,
	position_stage == _ATTACK_TG.underground
)
