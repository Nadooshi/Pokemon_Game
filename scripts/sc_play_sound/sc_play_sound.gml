///@desc sc_play_sound(sound, loop)
function sc_play_sound(_snd, _loop, _pitch, _gain) {
///@arg sound
///@arg loop:_boolean
if is_undefined(_pitch)
	_pitch = random_range(0.8, 1.2)
if is_undefined(_gain)
	_gain = 1
	if is_undefined(_loop)
		_loop = false
	if audio_exists(_snd) {
	    if audio_is_playing(_snd)
			audio_stop_sound(_snd)
	    var p_snd = audio_play_sound(_snd, 1, _loop)
	
		audio_sound_pitch(p_snd, _pitch)
		audio_sound_gain(p_snd, _gain, 0)
	}
	
}
