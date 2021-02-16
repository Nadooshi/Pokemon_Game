/// @desc Deal damage

if pokemon_id.speed_mod < modify
	pokemon_id.speed_mod = modify
	power_reg = 0.4 // 0.2

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
