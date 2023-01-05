/// @desc Init

event_inherited()

//mask_index = sp_shadow_path

sc_set_coll_areas(
	pokemon_map[? "position_stage"] == _POSITION.ground,
	pokemon_map[? "position_stage"] == _POSITION.fly,
	pokemon_map[? "position_stage"] == _POSITION.underground
)
