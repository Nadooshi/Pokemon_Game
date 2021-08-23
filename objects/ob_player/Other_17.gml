/// @desc Teleport

sc_set_behaviour(sc_player_stop_set)

//instance_deactivate_object(id)

with instance_create_layer(x, y, "Game", ob_player_teleport_start) {
	pokemon_id = other.id
	state_time = other.timeout
	timeout = other.power_cur / state_time
	ai_control = other.control_component
	tg_x = other.tgX
	tg_y = other.tgY
}
x = -20000000
y = -20000000
timeout = 0 //на всякий случай
alarm_set(0, -1)
alarm_set(1, -1)
alarm_set(2, -1)

with states
	instance_destroy()
ds_list_empty(states)

canMove = false
