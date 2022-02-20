/// @desc

// Inherit the parent event
event_inherited();
image_index = 0

if instance_exists(selected_id)
	switch parameter_name {
		case "passive_1":
			if sc_does_exist(selected_id.passive_state1) {
				image_index = selected_id.passive_state1[? "state"]
				hint = sc_remove_hashtag(selected_id.passive_state1[? "name"])
			}
		break;
		case "passive_2":
			if sc_does_exist(selected_id.passive_state2) {
				image_index = selected_id.passive_state2[? "state"]
				hint = sc_remove_hashtag(selected_id.passive_state2[? "name"])
			}
		break;
}
