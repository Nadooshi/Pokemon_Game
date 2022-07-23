/// @desc

wind_power = 0
wind_dir = random(360)
wind_d_dir = 0
wind_period = 1
overcast_period = 300
max_wind_power = 0.5
caption = "X - m/s"
if weather = _WEATHER.foggy or weather = _WEATHER.none {
	max_wind_power = 0
	wind_period = -1
	overcast_period = -1
	caption = "Calm"
}
alarm_set(0, wind_period)
alarm_set(1, overcast_period)


oX = x
oY = y
