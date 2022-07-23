/// @desc

c_c_t = [1, 1, 1] // constant_color_tint
if is_pmTime {
	var _ef = layer_get_fx("Effect_daytime")
	c_c_t = fx_get_parameter(_ef, "g_TintCol")
}

c_color_tint = [1, 1, 1] //current
tg_color_tint = [1, 1, 1]//target
d_color_tint = [0, 0, 0] //delta
mode = 0
proc_cnt = 0

alarm_set(0, 1)

function fn_refresh_screen_filter(color_tint) {
///@arg array_color_tint

var fx_cloudy = fx_create("_filter_tintfilter")
var fx_struct = fx_get_parameters(fx_cloudy)
fx_struct[$ "g_TintCol"] = [c_c_t[0] * color_tint[0], c_c_t[1] * color_tint[1], c_c_t[2] * color_tint[2]]
fx_set_parameters(fx_cloudy, fx_struct)
layer_set_fx("Effect_cloud", fx_cloudy)


}
