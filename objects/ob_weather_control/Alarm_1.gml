/// @desc spawn wind_emitters
var a = instance_number(ob_wind_emitter)
if not spawn_emi or a > 5 {
		alarm_set(1, -1)
		exit;
}

var _x = 200 + (random(room_width) - 200)
var _y = 200 + (random(room_height) - 200)
instance_create_layer(_x, _y, "Game", ob_wind_emitter, {
	wind_power	: other.wind_power,
	wind_dir	: other.wind_dir
})
