/// @desc

wind_d_dir = random(5)-10
wind_power = random(max_wind_power)
caption = string(wind_power * PixPerDist) + " - m/s"

spawn_emi = (wind_power > 1)

wind_period = random(frames_rate * 2) + frames_rate * 5
//wind_period = random(50) + 150 

alarm_set(0, wind_period)
