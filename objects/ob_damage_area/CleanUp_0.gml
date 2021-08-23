/// @desc

ds_list_destroy(last_damaged)
last_damaged = noone
ds_list_destroy(list_missed)
list_missed = noone
ds_list_destroy(just_damaged)
just_damaged = noone

ds_map_destroy(action)
action = noone

//show_debug_message(object_get_name(object_index)+ " (" + string(id)+") has been cleaned up");
