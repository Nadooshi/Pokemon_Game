/// @desc 
if not instance_exists(selected_id)
	exit

if selected_id.doActionNum = parent.index {
	var _action = selected_id.action_list[| selected_id.doActionNum]
	if sc_does_exist(_action) {	
		var _warm_max = _action[? "warmup"]+0.001
		warm_coeff = selected_id.attack_warmup / _warm_max
	}		
} else {
	warm_coeff = 0
}

power_ready = false
var _ls = ds_list_size(selected_id.action_list) -1
if _ls >= index
	if not is_undefined(selected_id.action_list[| index])
	if ds_map_find_value(selected_id.action_list[| index], "ap") <= selected_id.power_cur
		power_ready = true		
on_lock = false
if not is_undefined(selected_id.action_list[| index])
	if ds_map_find_value(selected_id.action_list[| index], "cooldown") > 0
		on_lock = true

