/// @desc	for cmp_collidable
function sc_set_coll_areas(_land_condition = false, _air_condition = false, _buried_condition = false) {
var _cond = [_land_condition, _air_condition, _buried_condition]
var _c_obj = [ob_collide_land, ob_collide_air, ob_collide_buried]

	if not variable_instance_exists(id, "coll_areas")
		coll_areas = ds_map_create()

	for (var i=0; i < array_length(_cond); i++)
	if _cond[i] {
		if not sc_does_exist(coll_areas[? i])
			coll_areas[? i]= instance_create_layer(x, y, "Game", _c_obj[i])
		coll_areas[? i].parent = id
		if sprite_exists(mask_index)
			coll_areas[? i].sprite_index = mask_index // sp_shadow_path
		else
			coll_areas[? i].sprite_index = sprite_index // sp_shado_path
		coll_areas[? i].image_xscale = image_xscale
		coll_areas[? i].image_yscale = image_yscale
		if variable_instance_exists(id, "size")
			coll_areas[? i].image_index = size
	} else
		with coll_areas[? i]
			instance_destroy()
}
