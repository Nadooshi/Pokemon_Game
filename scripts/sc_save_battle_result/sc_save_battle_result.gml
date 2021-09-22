function sc_save_battle_result() {
	
	var f = file_text_open_write("trainer_saves/" + string_lettersdigits(player1_trainer[? "name"])+".txt")
	
	file_text_close(f)
}

