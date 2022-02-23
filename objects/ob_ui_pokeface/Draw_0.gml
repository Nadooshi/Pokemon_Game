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

if ds_exists(pokemon_id.in_biome, ds_type_list)
for (var i=0; i<ds_list_size(pokemon_id.in_biome); i++) {
	var _xx = x + (sprite_get_width(sp_elemental) * 0.1 * i)// - biomes_w*0.5
	var _x = _xx - sprite_get_width(sp_elemental) * 0.1
	draw_sprite_ext(sp_elemental, pokemon_id.in_biome[| i], _x, biomes_y, 0.15, 0.15, 0, c_white, 1)
}

sc_draw_caption(caption)

