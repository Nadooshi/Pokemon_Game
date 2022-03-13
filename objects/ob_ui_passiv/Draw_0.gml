/// @desc

// Inherit the parent event
event_inherited();

var _x = sprite_height * 0.3
var _y = 25
if instance_exists(selected_id) {
	if parameter_name = "passive_1" {
		sc_draw_caption(selected_id.animation_set[? "time"][? "first"], 0.5, _x, 0)
		sc_draw_caption(sc_remove_hashtag(selected_id.animation_set[? "stat_name"][? "first"]), 0.2, _x, _y)
	}
	if parameter_name = "passive_2" {
		sc_draw_caption(selected_id.animation_set[? "time"][? "second"], 0.5, _x, 0)
		sc_draw_caption(sc_remove_hashtag(selected_id.animation_set[? "stat_name"][? "second"]), 0.2, _x, _y)
	}
}
