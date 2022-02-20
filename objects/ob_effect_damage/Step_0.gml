/// @desc
var _cur_par = 0
var _t = -1
var cur_snd

x = p_parent.x
y = p_parent.y

if alarm[0] < 0 {
	visible = false
	if ds_list_empty(que_cur) {
		alarm_set(0, -1)
		visible = false
	} else {
		_cur_par = ds_list_find_value(que_cur, 0)
		skeleton_attachment_set("el_attack0", string(_cur_par.el_attack))
		skeleton_attachment_set("el_def0", string(_cur_par.el_def))
		skeleton_animation_set(_cur_par.animation)
		_t = frames_rate * (skeleton_animation_get_frames(skeleton_animation_get()) / frames_rate)
		alarm_set(0, _t)
		visible = true
		switch _cur_par.animation {
			case "break" :
				cur_snd = snd_effect_element_break
				break;
			case "weak" :
				cur_snd = snd_effect_element_weak
				break;
		}
		sc_play_sound(cur_snd, false)

	}
}
