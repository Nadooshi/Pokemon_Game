/// @desc init particles

part_rain_splash = part_type_create()
part_type_sprite(part_rain_splash, sp_weather_rain_splash, true, false, false)
part_type_size(part_rain_splash, 0.5, 0.6, 0, 0)
part_type_life(part_rain_splash, 6, 6)
part_type_speed(part_rain_splash, 0, 0, 0, 0)


part_rain = part_type_create()
part_type_sprite(part_rain, sp_weather_rain, false, false, false)
part_type_size(part_rain, 0.5, 0.6, 0, 0)
part_type_direction(part_rain, 265, 275, 0, 0)
part_type_speed(part_rain, 3, 4, 0, 0)
part_type_life(part_rain, frames_rate, frames_rate * 2)
part_type_death(part_rain, 1, part_rain_splash)

part_snow = part_type_create()
part_type_sprite(part_snow, sp_weather_snow, true, false, true)
part_type_size(part_snow, 0.5, 0.6, 0, 0)
part_type_direction(part_snow, 240, 300, 0, 3)
part_type_orientation(part_snow, 0, 359, random(2)-1, 0, true)
part_type_speed(part_snow, 0.2, 2, 0, 0.1)
part_type_life(part_snow, frames_rate * 2, frames_rate * 5)

part_smoke = part_type_create()
part_type_sprite(part_smoke, sp_weather_ember_smoke, true, false, false)
part_type_size(part_smoke, 0.01, 0.1, 0.01, 0)
part_type_life(part_smoke, frames_rate, frames_rate+15)
part_type_direction(part_smoke, 85, 95, 0, 1)
part_type_speed(part_smoke, 0.3, 2, -0.1, 0.1)
part_type_alpha3(part_smoke, 0.2, 0.5, 0)
part_type_color1(part_smoke, c_grey)

part_ember = part_type_create()
part_type_sprite(part_ember, sp_weather_ember, false, false, true)
part_type_size(part_ember, 0.5, 1, 0, 0)
part_type_life(part_ember, frames_rate * 2, frames_rate * 3)
part_type_speed(part_ember, 0, 0, 0, 0)
part_type_step(part_ember, -15, part_smoke)
part_type_alpha2(part_ember, 1, 0)


part_ember_fall = part_type_create()
part_type_sprite(part_ember_fall, sp_weather_ember, false, false, true)
part_type_size(part_ember_fall, 0.5, 1, 0, 0)
part_type_direction(part_ember_fall, 265, 275, 0, 0)
part_type_orientation(part_ember_fall, 0, 359, random(2)-1, 0, false)
part_type_speed(part_ember_fall, 3, 5, 0, 0)
part_type_life(part_ember_fall, frames_rate, frames_rate * 2)
part_type_step(part_ember_fall, -15, part_smoke)
part_type_death(part_ember_fall, 1, part_ember)

