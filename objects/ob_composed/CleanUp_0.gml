/// @desc 

if not ds_exists(component_list, ds_type_list) then
	exit

for (var i=0; i<component_count; i++)
if object_exists(component_list[| i])
	event_perform_object(component_list[| i], ev_cleanup, 0)

