/// @desc 

// Inherit the parent event
event_inherited();

if selected	{
	gpu_set_blendmode(bm_add)
	draw_self()
	gpu_set_blendmode(bm_normal)
}

if not instance_exists(pokemon_id)
	exit

if ds_exists(pokemon_id.states, ds_type_list)
for (var i=0; i<ds_list_size(pokemon_id.states); i++) {
	var _state = pokemon_id.states[| i];
	if sc_does_exist(_state) {
		var _xx = x + (_state.sprite_width * 0.5 * i) - states_w*0.5
		var _x = _xx - _state.sprite_width * 0.5
		draw_sprite_ext(_state.sprite_index, _state.image_index, _x, states_y, 0.15, 0.15, 0, c_white, 1)
	}
}

var _x = x - (sprite_width * 0.5)
draw_set_color(0)
	draw_text_transformed(_x, y, caption, 0.35, 0.35, 0)
draw_set_color(c_white)
	draw_text_transformed(_x-2, y-2, caption, 0.35, 0.35, 0)


