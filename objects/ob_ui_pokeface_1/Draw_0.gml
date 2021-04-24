/// @desc 

if not instance_exists(pokemon_id)
	exit

event_inherited();

if ds_exists(pokemon_id.in_biome, ds_type_list)
for (var i=0; i<ds_list_size(pokemon_id.in_biome); i++) {
	var _xx = x + (sprite_get_width(sp_elemental) * 0.1 * i) - biomes_w*0.5
	var _x = _xx - sprite_get_width(sp_elemental) * 0.1
	draw_sprite_ext(sp_elemental, pokemon_id.in_biome[| i], _x, biomes_y, 0.15, 0.15, 0, c_white, 1)
}
