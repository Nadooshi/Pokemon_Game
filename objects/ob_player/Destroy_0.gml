/// @desc 

event_inherited()

ds_map_destroy(animation_set)

with instance_create_depth(x, y, depth, ob_explosion) {
	sprite_index = other.sprite_index
	image_index  = other.image_index
	image_xscale = other.image_xscale
	image_yscale = other.image_yscale
	init_image_index = image_index
	init_sprite_index = sprite_index
}

for (var i=0; i<ds_list_size(states); i++)
if instance_exists(states[| i]) {
	instance_destroy(states[| i])
	states[| i] = noone
}

if sc_does_exist(passive_state1) {
	ds_map_destroy(passive_state1)
	passive_state1 = noone
}
if sc_does_exist(passive_state2) {
	ds_map_destroy(passive_state2)
	passive_state2 = noone
}
ds_list_clear(in_biome)

//==========================================================
// End battle & Lose
var d_poke = 0
for (var i=0; i<ds_list_size(trainer[? "pokemon_ids"]); i++) {
	var p = trainer[? "pokemon_ids"][| i]
	if p.health_cur <= 0
		d_poke++
}

if d_poke = ds_list_size(trainer[? "pokemon_ids"])
with ob_init_battle {
	alarm_set(0, 300)
	trainer_loser = other.trainer
}
//==========================================================
instance_destroy(mark_hostile)
instance_destroy(effect_bullet)
//show_debug_message(object_get_name(object_index) + " (" + string(id)+") deactivated" )
instance_deactivate_object(id)

