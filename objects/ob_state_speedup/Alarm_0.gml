/// @desc Deal damage

if pokemon_id.speed_mod < modify
	pokemon_id.speed_mod = modify
	power_reg = 0.5 // 0.3

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
