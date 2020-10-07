/// @desc Deal damage

with pokemon_id 
	if (health_cur + other.damage) > health_max
		health_cur = health_max
	else
		health_cur += other.damage

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
