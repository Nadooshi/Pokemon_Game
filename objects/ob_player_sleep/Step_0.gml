/// @desc

// Inherit the parent event
event_inherited();
if hurt_cur > 0
	for (var i=0; i<ds_list_size(states); i++)
	if states[| i].object_index == ob_state_lulling
		states[| i].hit_count = 0

