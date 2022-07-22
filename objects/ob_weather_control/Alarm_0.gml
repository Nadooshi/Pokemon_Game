/// @desc

wind_d_dir = random(5)-10
wind_power = random(max_wind_power)
caption = string(wind_power * 6) + " - m/s"


wind_period = random(180) + 300 
//wind_period = random(50) + 150 

alarm_set(0, wind_period)
