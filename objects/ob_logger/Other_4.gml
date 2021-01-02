/// @desc

alarm_set(0, 300)

var _date = date_date_string(date_current_datetime())
fname  = file_text_open_write("log_saves/" + _date +".txt")
