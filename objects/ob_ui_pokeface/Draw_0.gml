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
	var _xx = x + (sprite_get_width(sp_elemental) * 0.1 * i) - biomes_w*0.5
	var _x = _xx - sprite_get_width(sp_elemental) * 0.1
	
	var _coeff = 1
	_coeff *= sc_element_coeff(pokemon_id.in_biome[| i], pokemon_id.pokemon_map[? "elemental_type"])
	_coeff *= sc_element_coeff(pokemon_id.in_biome[| i], pokemon_id.pokemon_map[? "material_type"])
	
	if _coeff > 1 {
		draw_sprite_ext(sp_elemental, pokemon_id.in_biome[| i], _x, biomes_y, 0.15, 0.15, 0, c_white, 1)
		gpu_set_blendmode(bm_add)
		draw_sprite_ext(sp_elemental, pokemon_id.in_biome[| i], _x, biomes_y, 0.15, 0.15, 0, c_white, 0.5)
		draw_sprite_ext(
			sp_elemental, pokemon_id.in_biome[| i],
			_x + random(1.5)-0.75, biomes_y  + random(1.5) - 0.75 , 0.15, 0.15, 0, c_white, 0.5
		)
		gpu_set_blendmode(bm_normal)
	} else
	if _coeff < 1 {
		draw_sprite_ext(sp_elemental, pokemon_id.in_biome[| i], _x, biomes_y, 0.15, 0.15, 0, c_white, 0.5)
	} else
		draw_sprite_ext(sp_elemental, pokemon_id.in_biome[| i], _x, biomes_y, 0.15, 0.15, 0, c_white, 1)
	
}

var _x = x - (sprite_width * 0.5)
draw_set_color(0)
	draw_text_transformed(_x, y, caption, 0.35, 0.35, 0)
draw_set_color(c_white)
	draw_text_transformed(_x-2, y-2, caption, 0.35, 0.35, 0)


