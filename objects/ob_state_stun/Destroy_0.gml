/// @desc

// Inherit the parent event
event_inherited();

with pokemon_id {
	damage_mod = 1
	speed_mod = 0
	dodge_mod = 0
	accuracy_mod = 0
	power_reg = power_regeneration
	if moveSpeed > 0
		moveSpeed = max(0.25, maxSpeed + speed_mod)
}
