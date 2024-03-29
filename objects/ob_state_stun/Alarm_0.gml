/// @desc Deal damage

with pokemon_id {
	if damage_mod > 0.5
		damage_mod = 0.5
	speed_mod = maxSpeed * -0.5
	if moveSpeed > 0
		moveSpeed = max(0.25, maxSpeed + speed_mod)	
	if dodge_mod < 0.5
		dodge_mod = 0.5
	if accuracy_mod > -0.5
		accuracy_mod = -0.5
	power_reg = min(power_reg, 0.1) // 0.2
}

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
