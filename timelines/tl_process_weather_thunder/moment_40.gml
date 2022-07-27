fn_refresh_screen_filter(c_color_tint)
var part_thunder = part_type_create()

part_type_sprite(part_thunder, sp_weather_lightining, true, true, true)
part_type_scale(part_thunder, 3, 3)
part_type_color1(part_thunder, c_white)
part_type_life(part_thunder, 30, 30)
part_type_alpha2(part_thunder, 0.5, 0)
part_particles_create(part_sys_weather, 0, 0, part_thunder, 1)

var _snd = choose(snd_thunderstorm_1, snd_thunderstorm_2, snd_thunderstorm_3)
sc_play_sound(_snd, false, 1, 1)

timeline_running = false