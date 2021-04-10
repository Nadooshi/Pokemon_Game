/// @desc create sky cloud

var _sz = 1.5 + random(1.5)
var _cx = camera_get_view_x(view_camera[0])
var _cy = camera_get_view_y(view_camera[0])
var _cw = camera_get_view_width(view_camera[0]) * 0.5
var _ch = camera_get_view_height(view_camera[0]) * 0.5
var _d = sqrt(_cw*_cw + _ch*_ch) * 0.25

var _gamma = wind_dir + random(0.2)

with instance_create_layer(0, 0, "Particles", ob_weather_skycloud) {
	image_index = irandom_range(0, image_number)
	image_alpha = 0.25
	image_xscale = _sz
	image_yscale = _sz
	image_angle = random(359)
	x = (_cx + _cw) + cos(_gamma + pi) * (_d + sprite_width)
	y = (_cy + _ch) + sin(_gamma + pi) * (_d + sprite_height)
}

var _overcast = (overcast_period/2 + irandom(overcast_period))*(3-wind_power)
alarm_set(1, _overcast)


