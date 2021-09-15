/// @desc Update
// map = trainer

event_perform_object(ob_ui_object, ev_other, ev_user0)

if parameter_name != "" 
if sc_does_exist(map) {
	var _pokemon = ds_list_find_value(map[? parameter_name], index)
	if not is_undefined(_pokemon) {
		image_index = _pokemon[? "face"] + 0.01
		hint = _pokemon[? "title"]
		visible = true
	} else
		visible = false
}
