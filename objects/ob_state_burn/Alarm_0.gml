/// @desc Deal damage

with pokemon_id {
	power_reg = 0.1 // 0.3
	hurt_reg = 0
	health_reg = 0
}

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
