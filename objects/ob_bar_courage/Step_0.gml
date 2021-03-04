/// @desc

if instance_exists(pokemon_id) {
	value = pokemon_id.courage_cur
	value2 = pokemon_id.courage_threshold
	if value > value2
		sprite_index = sp_for_health
	else
		sprite_index = sp_for_hurt
} else
	instance_destroy()
