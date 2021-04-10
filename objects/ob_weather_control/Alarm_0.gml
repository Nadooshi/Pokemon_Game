/// @desc

wind_d_dir = random(0.4)-0.2
wind_power = random(0.5)
caption = string(wind_power * 6) + " - m/s"

wind_period = random(180) + 300 //random(300) + 1200
alarm_set(0, wind_period)
