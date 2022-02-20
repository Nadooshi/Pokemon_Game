///@desc sc_play_sound(sound, loop)
function sc_play_sound(_snd, _loop) {

	if is_undefined(_loop)
		_loop = false

	if audio_exists(_snd) {
	    if audio_is_playing(_snd) audio_stop_sound(_snd)
	    audio_play_sound(_snd, 1, _loop)
	}
}
