/// @desc 
// process particle effect
var _x, _y, _h, _w
_x = camera_get_view_x(view_camera[0])
_y = camera_get_view_y(view_camera[0])
_h = camera_get_view_height(view_camera[0])
_w = camera_get_view_width(view_camera[0])
part_system_position(part_sys_weather, _x, _y)

if fallout != _FALLOUT_TYPE.none 
	part_emitter_region(part_sys_weather, emi_weather, -100, _w + 100, 0, 0, ps_shape_line, ps_distr_linear)




//process cloud
if weather = _WEATHER.cloudy{
	if ++proc_cnt < frames_rate {
		for (var i = 0; i < 3; i++) {
			d_color_tint[i] = (tg_color_tint[i] - c_color_tint[i]) / frames_rate
			if d_color_tint[i] < 0
			if c_color_tint[i] + d_color_tint[i] > tg_color_tint[i] {
				c_color_tint[i] += d_color_tint[i]
			} else {
				c_color_tint[i] = tg_color_tint
				d_color_tint[i] = 0
			}
			if d_color_tint[i] > 0
			if c_color_tint[i] + d_color_tint[i] < tg_color_tint[i] {
				c_color_tint[i] += d_color_tint[i]
			} else {
				c_color_tint[i] = tg_color_tint
				d_color_tint[i] = 0
			}
		}
		sc_refresh_screen_filter(c_color_tint, c_c_t)
	} else {
		proc_cnt = frames_rate
		d_color_tint = [0,0,0]
		if alarm[0] < 0
			alarm_set(0, frames_rate * random_range(1, 10))
	}
	if mode = 1
	with ob_player
		clear_sky = false

}


if timeline_exists(timeline_index)
if timeline_position > timeline_max_moment(timeline_index) {
	with obj_rel_fallout
		instance_destroy()
	timeline_running = false
}



