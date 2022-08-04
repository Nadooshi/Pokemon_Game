var fx_screen = fx_create("_filter_tintfilter")
var fx_struct = fx_get_parameters(fx_screen)
fx_struct[$ "g_TintCol"] = [1, 1, 1]
fx_set_parameters(fx_screen, fx_struct)
layer_set_fx("Effect_cloud", fx_screen)


