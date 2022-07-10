/// @desc

with pokemon_id {
	x = other.x
	y = other.y
	sc_canMove(true)
	sc_composed_add_component(cmp_collidable_player, true)
	position_stage = other.o_position_stage
	image_alpha = 1
	if sc_does_exist(passive_state1)
		alarm_set(0, (passive_state1[? "state_time"] + passive_state1[? "state_cooldown"]) * 60)
	if sc_does_exist(passive_state2)
		alarm_set(1, (passive_state2[? "state_time"] + passive_state2[? "state_cooldown"]) * 60)
	alarm_set(2, AUTOTARGET_PERIOD)
}

//instance_activate_object(pokemon_id)
with pokemon_id
	power_cur = max(other.timeout * other.state_time, 0)


