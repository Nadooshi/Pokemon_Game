/// @desc

var _cw = camera_get_view_width(view_camera[0])
var _ch = camera_get_view_height(view_camera[0])
var _cx = camera_get_view_x(view_camera[0]) - _cw * 0.5
var _cy = camera_get_view_y(view_camera[0]) - _ch * 0.5
var _cw = _cw * 2
var _ch = _ch * 2

if bbox_left > (_cx + _cw) or bbox_top > (_cy + _ch)
	or bbox_right < _cx or bbox_bottom < _cy {
	instance_destroy()
}
	
