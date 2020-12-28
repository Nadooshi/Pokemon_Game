/// @desc Save log

	var fname  = "log_saves/" + date_date_string(date_current_datetime()) +".ini"

	ini_open(fname)
//		ini_write_string("trainer", "map" ,	ds_list_write (log_battle))



	ds_list_destroy(log_battle)
	ini_close()