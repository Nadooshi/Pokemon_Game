/// @desc
c_c_t = [1, 1, 1] // constant_color_tint : color tint for current weather
if is_pmTime {
	var _ef = layer_get_fx("Effect_daytime")
	c_c_t = fx_get_parameter(_ef, "g_TintCol")
}

c_color_tint = [1, 1, 1] //current
tg_color_tint = [1, 1, 1]//target
d_color_tint = [0, 0, 0] //delta
mode = 0
proc_cnt = 0

obj_rel_fallout = noone

alarm_set(0, 1)

