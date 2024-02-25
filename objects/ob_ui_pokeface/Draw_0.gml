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
	if sc_does_exist(_state, undefined, "'_state' in Draw") {
		var _xx = x + (_state.sprite_width * 0.5 * i) - states_w * 0.5
		var _x = _xx - _state.sprite_width * 0.5
		draw_sprite_ext(_state.sprite_index, _state.image_index, _x, states_y, 0.1, 0.1, 0, c_white, 1)
	}
}
var sp_sz = sprite_get_width(sp_elemental) * 0.09
if ds_exists(pokemon_id.in_biome, ds_type_list)
for (var i=0; i<ds_list_size(pokemon_id.in_biome); i++) {
	var _coeff = 1
	var sp_w = 0.1
	_coeff *= sc_element_coeff(pokemon_id.in_biome[| i], pokemon_id.pokemon_map[? "elemental_type"])
	_coeff *= sc_element_coeff(pokemon_id.in_biome[| i], pokemon_id.pokemon_map[? "material_type"])
	if _coeff > 1
		sp_w = 0.15
	var _xx = x - (sp_sz * ds_list_size(pokemon_id.in_biome) * 0.5) + sp_sz * 0.5
	var _x = _xx + sp_sz * i
	draw_sprite_ext(sp_elemental, pokemon_id.in_biome[| i], _x, biomes_y, sp_w, sp_w, 0, c_white, 1)
}

//sc_draw_caption(caption, undefined, undefined, undefined)

