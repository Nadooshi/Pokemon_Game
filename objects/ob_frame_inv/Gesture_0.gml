/// @desc
var a_map = noone
var _index = index
with selected_id
if _index <= ds_list_size(action_list) {
	a_map = action_list[| _index]
	if not is_undefined(a_map) {
		target = ob_cursor
		doActionNum = _index
		event_perform(ev_other, ev_user3)
	}
}

