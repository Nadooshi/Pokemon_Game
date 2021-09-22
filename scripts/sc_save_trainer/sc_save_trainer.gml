function sc_save_trainer() {

	var fname  = "trainer_saves/" + string_lettersdigits(current_trainer[? "name"])+".txt"

	var f = file_text_open_write(fname)
	var _s = json_encode(current_trainer)
		file_text_write_string(f, _s)
	file_text_close(f)

}
