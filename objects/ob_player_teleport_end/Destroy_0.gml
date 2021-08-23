/// @desc

with pokemon_id {
x = other.x
y = other.y
canMove = true
alarm_set(0, (passive_state1[? "state_time"] + passive_state1[? "state_cooldown"]) * 60)
alarm_set(1, (passive_state2[? "state_time"] + passive_state2[? "state_cooldown"]) * 60)
alarm_set(2, AUTOTARGET_PERIOD)
}

//instance_activate_object(pokemon_id)
with pokemon_id
	power_cur = max(other.timeout * other.state_time, 0)


