/// @desc create related fallouts
var _x = 500//200 + (random(room_width) - 200)
var _y = 500//200 + (random(room_height) - 200)

switch fallout {
	case _FALLOUT_TYPE.rain: {
		if not instance_exists(obj_rel_fallout) {
			obj_rel_fallout = instance_create_layer(_x, _y, "Elements", ob_thunder_base)
			timeline_index = choose(tl_weather_thunder_1, tl_weather_thunder_2, tl_weather_thunder_3) 
			timeline_position = 0
			timeline_running = true
		}
		with ob_player
		if ds_list_find_index(in_biome, _MATERIAL.electric) = -1
			ds_list_add(in_biome, _MATERIAL.electric)
		
		break;
	}
}

alarm_set(1, frames_rate * random_range(2, 15))

