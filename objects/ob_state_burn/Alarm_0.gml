/// @desc Deal damage
event_inherited()
with pokemon_id {
	hurt_reg = 0
	health_reg = 0
}

alarm[0] = period;
if --hit_count < 0
	instance_destroy()
	
