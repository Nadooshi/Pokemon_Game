/// @desc cooldown for not repeatable actions
alarm_set(3, frames_rate)
var _l = ds_list_size(action_list)
for (var i = 0; i<_l; i++)
if not is_undefined(action_list[| i])
	action_list[| i][? "cooldown"] = max(action_list[| i][? "cooldown"] - 1, 0)

