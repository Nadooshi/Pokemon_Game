/// @desc

wind_power = 0
wind_dir = random(360)
wind_d_dir = 0
wind_period = 1
overcast_period = 300

max_wind_power = 0.5

alarm_set(0, wind_period)
alarm_set(1, overcast_period)

caption = "0 - m/s"

oX = x
oY = y
