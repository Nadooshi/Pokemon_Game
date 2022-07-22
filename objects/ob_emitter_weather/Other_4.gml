/// @desc


alarm_set(0,1)

part_sys_weather = part_system_create_layer("Effect_weather", false)
event_perform(ev_other, ev_user0)

var p_count = 0
var p_type = undefined
switch weather {
	case _WEATHER.rainy: {
		p_count = 1
		break;
	}
	case _WEATHER.stormy: {
		p_count = 2
		break;
	}
}
switch fallout {
	case _FALLOUT_TYPE.rain :{
		p_type = part_rain
		break;
	}
	case _FALLOUT_TYPE.snow :{
		p_type = part_snow
		break;
	}
	case _FALLOUT_TYPE.ember :{
		p_count = -5
		p_type = part_ember_fall
		break;
	}
}
if not is_undefined(p_type) {
	emi_weather = part_emitter_create(part_sys_weather)
	part_emitter_stream(part_sys_weather, emi_weather, p_type, p_count)
}
