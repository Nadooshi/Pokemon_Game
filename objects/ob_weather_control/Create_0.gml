/// @desc

wind_power = 0
wind_dir = random(360)
wind_d_dir = 0
wind_period = 1
caption = "X - m/s"
switch weather {
	case _WEATHER.none:
	case  _WEATHER.foggy: {
		max_wind_power = 0
		wind_period = -1
		caption = "Calm"
		break;
	}
	case _WEATHER.clear: {
		max_wind_power = 0.5
		break;
	}
	case _WEATHER.cloudy:{
		max_wind_power = 1
		break;
	}
	case _WEATHER.rainy:{
		max_wind_power = 1.5
		break;
	}
	case _WEATHER.stormy:
		max_wind_power = 2
}

alarm_set(0, wind_period)
alarm_set(1, 1)
spawn_emi = false

oX = x
oY = y
