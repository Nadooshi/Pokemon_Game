/// @desc 

event_inherited()

ds_map_destroy(action)
action = noone
ds_list_destroy(list_missed)
list_missed = noone
show_debug_message(object_get_name(object_index)+ " (" + string(id)+") has been cleaned up");
