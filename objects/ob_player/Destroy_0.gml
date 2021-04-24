/// @desc 

event_inherited()

ds_list_delete(trainer[? "pokemon_ids"], ds_list_find_index(trainer[? "pokemon_ids"], id))

with instance_create_depth(x, y, depth, ob_explosion) {
	sprite_index = other.sprite_index
	image_index  = other.image_index
	image_xscale = other.image_xscale
	image_yscale = other.image_yscale
	init_image_index = image_index
	init_sprite_index = sprite_index
}

for (var i=0; i<ds_list_size(states); i++)
if instance_exists(states[| i])
	instance_destroy(states[| i])

if sc_does_exist(passive_state1)
	ds_map_destroy(passive_state1)
if sc_does_exist(passive_state2)
	ds_map_destroy(passive_state2)
//if ds_list_size(trainer[? "pokemon_ids"]) = 0
//	with ob_cursor
//		alarm_set(0, 300)

ds_list_clear(in_biome)

show_debug_message(object_get_name(object_index) + " (" + string(id)+") deactivated" )
instance_deactivate_object(id)

