/// @desc
radius = 1
color = make_color_rgb(irandom(150), 255 - irandom(80), irandom(150))

part_leaf_blow = part_type_create()

part_type_sprite(part_leaf_blow, sp_wind_leaf_blow, false, false, true)
part_type_size(part_leaf_blow, 0.5, 1, 0, 0)
part_type_life(part_leaf_blow, 30, 90)
part_type_orientation(part_leaf_blow, 0, 360, 5, 0, false)
part_type_color1(part_leaf_blow, color)

part_wind_emitter = part_emitter_create(part_system_wind)
part_emitter_stream(part_system_wind, part_wind_emitter, part_leaf_blow, -5)

alarm_set(1, frames_rate * (3 + random(5)))

snd_g = wind_power - 1
if snd_g < 0.5
	snd_g = 0.5
snd = choose(snd_wind_1, snd_wind_2, snd_wind_3, snd_wind_4, snd_wind_5, snd_wind_6, snd_wind_7, snd_wind_8)
sc_play_sound(snd, false, undefined, snd_g)

