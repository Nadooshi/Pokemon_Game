/// @desc

with pokemon_id {
	x = other.x
	y = other.y
	sc_canMove(true)
	sc_ai_give_up()
	position_stage = other.o_position_stage
	event_perform(ev_step, ev_step_begin)
	image_alpha = 1
	if sc_does_exist(passive_state1)
		alarm_set(0, (passive_state1[? "state_time"] + passive_state1[? "state_cooldown"]) * 60)
	if sc_does_exist(passive_state2)
		alarm_set(1, (passive_state2[? "state_time"] + passive_state2[? "state_cooldown"]) * 60)
	alarm_set(2, AUTOTARGET_PERIOD)

	power_cur = max(other.timeout * other.state_time, 0)
}



