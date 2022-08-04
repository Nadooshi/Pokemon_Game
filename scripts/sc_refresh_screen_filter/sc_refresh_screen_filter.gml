function sc_refresh_screen_filter(color_tint, weater_color_tint) {
///@arg array_color_tint
var fx_cloudy = fx_create("_filter_tintfilter")
var fx_struct = fx_get_parameters(fx_cloudy)
fx_struct[$ "g_TintCol"] = [
	weater_color_tint[0] * color_tint[0],
	weater_color_tint[1] * color_tint[1],
	weater_color_tint[2] * color_tint[2]
]

fx_set_parameters(fx_cloudy, fx_struct)
layer_set_fx("Effect_cloud", fx_cloudy)


}
