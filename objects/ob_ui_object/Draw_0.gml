/// @desc
var _filter = (image_xscale<1 or image_yscale<1)

if _filter	
	gpu_set_tex_filter(true)

if sprite_exists(sprite_index)
	draw_self()

if _filter	
	gpu_set_tex_filter(false)

event_perform(ev_other, ev_user1)

