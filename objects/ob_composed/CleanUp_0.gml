/// @desc 

if not sc_does_exist(component_list, ds_type_list, "'component_list' in Clean Up")
	exit

for (var i=0; i<component_count; i++)
if not is_undefined(component_list[| i])
if object_exists(component_list[| i])
	event_perform_object(component_list[| i], ev_cleanup, 0)

