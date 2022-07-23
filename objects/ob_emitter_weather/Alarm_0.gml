/// @desc
if weather = _WEATHER.cloudy
switch mode {
	case  0 :{// cloud
		tg_color_tint = [0.699, 0.684, 0.617]
		mode = 1
		break;
	}
	case  1 :{// clear
		tg_color_tint = [1, 1, 1]
		mode = 0
		break;
	}
}
proc_cnt = 0
