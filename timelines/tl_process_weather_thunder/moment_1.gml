var fx_screen = fx_create("_filter_tintfilter")
var fx_struct = fx_get_parameters(fx_screen)
fx_struct[$ "g_TintCol"] = [0, 0, 0]
fx_set_parameters(fx_screen, fx_struct)
layer_set_fx("Effect_cloud", fx_screen)

var part_thunder = part_type_create()

part_type_sprite(part_thunder, sp_weather_lightining, true, true, true)
part_type_scale(part_thunder, 3, 3)
part_type_color1(part_thunder, c_white)
part_type_alpha1(part_thunder, 1)
part_type_life(part_thunder, 20, 20)
part_particles_create(part_sys_weather, 0, 0, part_thunder, 1)
