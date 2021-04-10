/// @desc

wind_power = 0
wind_dir = random(pi*2)   // radians
wind_d_dir = 0
wind_period = 1
overcast_period = 300

alarm_set(0, wind_period)
alarm_set(1, overcast_period)

caption = "0 - m/s"

oX = x
oY = y

repeat (5) {
	var _sz = 1.5 + random(1.5)
	with instance_create_layer(0, 0, "Particles", ob_weather_skycloud) {
		image_index = irandom_range(0, image_number)
		image_alpha = 0.25
		image_xscale = _sz
		image_yscale = _sz
		image_angle = random(359)
		x = random(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]))
		y = random(camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))
	}
}
