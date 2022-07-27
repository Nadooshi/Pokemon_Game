/// @desc
layer_set_visible("Effect_daytime", is_pmTime)

// set param filter cloud
switch weather {
	case _WEATHER.clear: {
		c_color_tint = [1, 1, 1]
		break;
	}
	case _WEATHER.cloudy: {
		c_color_tint = [1, 1, 1]
		break;
	}
	case _WEATHER.foggy: {
		c_color_tint = [0.8, 0.8, 0.8]
		break;
	}
	case _WEATHER.rainy: {
		c_color_tint = [0.799, 0.784, 0.717]
		break;
	}
	case _WEATHER.stormy: {
		c_color_tint = [0.55, 0.55, 0.48]
		break;
	}
}
fn_refresh_screen_filter(c_color_tint)
//=========================
alarm_set(0,1)

part_sys_weather = part_system_create_layer("Effect_weather", false)
event_perform(ev_other, ev_user0) // init particles

var p_count = 0
var p_type = undefined
switch weather {
	case _WEATHER.foggy: {
		repeat (10){
			var _x = 200 + (random(room_width) - 200)
			var _y = 200 + (random(room_height) - 200)
			instance_create_layer(_x, _y, "Game", ob_cloud, {
				speed : 0.05,
				direction : random(360),
				image_xscale : 2 + random(1),
				image_yscale : 2,
				image_alpha : 0.5
			})
		}
		break;
	}
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
		sc_play_sound(snd_rain, true, 1, 0.75)
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
