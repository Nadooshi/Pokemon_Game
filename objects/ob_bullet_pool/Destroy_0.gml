/// @desc 

event_perform_object(ob_composed, ev_destroy, 0)

//for (var i=0; i<ds_stack_size(drops); i++)
for (var i=0; i<ds_list_size(drops); i++)
if is_struct(drops[| i])
	delete drops[| i]

ds_list_destroy(drops)


