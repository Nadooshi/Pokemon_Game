/// @desc 

// Inherit the parent event
event_perform_object(ob_composed, ev_step, ev_step_normal)

var _k = ds_map_find_first(coll_areas)
while not is_undefined(_k) {
	coll_areas[? _k].image_xscale = radius / 8
	coll_areas[? _k].image_yscale = radius / 8
	_k = ds_map_find_next(coll_areas, _k)
}

if timeout>0 {
	timeout--
	if timeout<=0 
		instance_destroy()
}

