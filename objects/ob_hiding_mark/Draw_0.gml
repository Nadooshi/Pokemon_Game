/// @desc 

if instance_exists(parent_pokemon) {
	gpu_set_blendmode(bm_add)
	with parent_pokemon
		draw_sprite(sprite_index, image_index, other.x, other.y)
	gpu_set_blendmode(bm_normal)
}
