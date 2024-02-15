/// @desc 
try {
	instance_destroy(coll_area)
	ds_list_destroy(collided_with_list)
	collided_with_list = noone
}
catch (_extention) {
    show_message(_exception.message);
    show_message(_exception.longMessage);
    show_message(_exception.script);
    show_message(_exception.stacktrace);
}