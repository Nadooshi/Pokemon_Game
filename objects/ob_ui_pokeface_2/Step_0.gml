/// @desc 

if not instance_exists(pokemon_id)
	exit

event_inherited();

//if ds_exists(pokemon_id, ds_type_map)
if ds_exists(pokemon_id.states, ds_type_list) {
	biomes_w = (ds_list_size(pokemon_id.in_biome)-1) * (sprite_get_width(sp_state) * 0.15)*0.5
	biomes_y = y - sprite_height * 0.75;
}
