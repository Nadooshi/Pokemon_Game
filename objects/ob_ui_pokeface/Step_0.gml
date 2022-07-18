/// @desc Calculate state pos

if not instance_exists(pokemon_id)
	exit
	
if ds_exists(pokemon_id.states, ds_type_list) {
	states_w = (ds_list_size(pokemon_id.states)-1) * (sprite_get_width(sp_state) * 0.15) * 0.5
	states_y = y - sprite_height * 0.5;
}

ds_map_clear(sparkle_active)
var sp_sz = sprite_get_width(sp_elemental) * 0.09
if ds_exists(pokemon_id.in_biome, ds_type_list)
for (var i=0; i < ds_list_size(pokemon_id.in_biome); i++) {
	var _xx = x - (sp_sz * ds_list_size(pokemon_id.in_biome) * 0.5) + sp_sz * 0.5
	var _x = _xx + sp_sz * i
	
	var _coeff = 1
	_coeff *= sc_element_coeff(pokemon_id.in_biome[| i], pokemon_id.pokemon_map[? "elemental_type"])
	_coeff *= sc_element_coeff(pokemon_id.in_biome[| i], pokemon_id.pokemon_map[? "material_type"])
	
	if _coeff != 1 {
		if not sc_does_exist(sparkle_objs[? pokemon_id.in_biome[| i]]) {
			var _sp_id = instance_create_layer(_x-4, biomes_y, "UI", ob_spark_effect)
			_sp_id.active = true
			sparkle_objs[? pokemon_id.in_biome[| i]] = _sp_id
		}
		sparkle_objs[? pokemon_id.in_biome[| i]].x = _x - sprite_get_width(sp_elemental) * 0.04
		sparkle_objs[? pokemon_id.in_biome[| i]].y = biomes_y
		sparkle_active[? pokemon_id.in_biome[| i]] = true
		if _coeff > 1 {
			sparkle_objs[? pokemon_id.in_biome[| i]].sparkcolor = c_yellow
			sparkle_objs[? pokemon_id.in_biome[| i]].speedY = 0.25
		}
		if _coeff < 1 {
			sparkle_objs[? pokemon_id.in_biome[| i]].sparkcolor = c_maroon
			sparkle_objs[? pokemon_id.in_biome[| i]].speedX = random(0.5)-0.25
			sparkle_objs[? pokemon_id.in_biome[| i]].speedY = -0.25
		}
	}
}

i = ds_map_find_first(sparkle_objs) 
while not is_undefined(i) {
if is_undefined(sparkle_active[? i])
	with sparkle_objs[? i]
		active = false
	i = ds_map_find_next(sparkle_objs, i)
}

var _c = ""
with pokemon_id 
if ds_list_find_index(component_list, cmp_control_ai) {
	var _action = action_list[| plannedActionNum] 
	if not is_undefined(_action)
		_c = _action[? "name"]
	else
		_c = " .zZ !!!11"
}

caption = _c

