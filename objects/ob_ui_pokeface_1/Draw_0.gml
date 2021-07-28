/// @desc 

if not instance_exists(pokemon_id){
	var	i = ds_map_find_first(sparkle_objs) 
	while not is_undefined(i) {
		with sparkle_objs[? i]
			active = false
		i = ds_map_find_next(sparkle_objs, i)
	}
	exit
}

event_inherited();

