/// @desc cloud tint colorize

var _x, _y, _h, _w
_x = camera_get_view_x(view_camera[0])
_y = camera_get_view_y(view_camera[0])
_h = camera_get_view_height(view_camera[0])
_w = camera_get_view_width(view_camera[0])
part_emitter_region(part_sys_weather, emi_weather, _x, _x+_w, _y, _y, ps_shape_line, ps_distr_linear)

