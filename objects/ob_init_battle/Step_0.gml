/// @desc Move camera

var _ok = false
var _x, _y;
var _cx, _cy;
var _tx, _ty;
var _avX = 0
var _avY = 0
_cx = camera_get_view_x(view_camera[0])
_cy = camera_get_view_y(view_camera[0])
ds_list_clear(watching)

if not is_undefined(selected_id) and instance_exists(selected_id) {
	ds_list_add(watching, selected_id)
} else
with ob_player
if trainer = player1_trainer
	ds_list_add(other.watching, id)


var _count = ds_list_size(watching)
for (var i = 0; i < _count; i++) 
with watching[| i] {
	_avX += x
	_avY += y
	_ok = true
}


if _ok {
	_avX /= _count
	_avY /= _count
	_tx =  _avX - camera_get_view_width (view_camera[0]) * 0.5
	_ty =  _avY - camera_get_view_height(view_camera[0]) * 0.5
	_tx = clamp(_tx, 0, room_width -camera_get_view_width (view_camera[0]))
	_ty = clamp(_ty, 0, room_height-camera_get_view_height(view_camera[0]))
	
	_x = lerp(_cx, _tx, 0.1)
	_y = lerp(_cy, _ty, 0.1)
	camera_set_view_pos(view_camera[0], _x, _y )
}

_cx = camera_get_view_x(view_camera[0])
_cy = camera_get_view_y(view_camera[0])

//// move UI objects
with (ob_control_touch) {
	x = _cx + oX
	y = _cy + oY
}

with (ob_frame) {
	x = _cx + oX
	y = _cy + oY
}

/// count time
dTime = min(delta_time/1000000, 1/minFPS)
