/// @desc	for cmp_collidable
function sc_set_coll_areas(_sprite_index, _land_condition = false, _air_condition = false, _buried_condition = false) {
var _cond = [_land_condition, _air_condition, _buried_condition]
var _c_obj = [ob_collide_land, ob_collide_air, ob_collide_buried]

	for (var i=0; i < array_length(_cond); i++)
	if _cond[i] {
		if not sc_does_exist(coll_areas[? i])
			coll_areas[? i]= instance_create_layer(x, y + 12, "Game", _c_obj[i])
		coll_areas[? i].parent = id
		coll_areas[? i].sprite_index = _sprite_index // sp_shadowworld
		coll_areas[? i].image_index = size
	} else
		with coll_areas[? i]
			instance_destroy()


}