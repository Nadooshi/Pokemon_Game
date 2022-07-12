/// @desc process clear sky

if r_close_air <= 0
	exit

var _p_obj = ds_list_create()
var _sz = collision_circle_list(x,y, r_close_air, ob_player, false, false, _p_obj, false)	
if	_sz > 0
for (var i = 0; i < _sz; i++)
	_p_obj[| i].clear_sky = false

alarm_set(1, 30)

ds_list_destroy(_p_obj)
