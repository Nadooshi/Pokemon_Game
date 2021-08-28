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
	oX = other.x
	oY = other.y + 12
	o_position_stage = other.position_stage
	t_dist = other.hurt_timeout
}

sc_composed_remove_component(cmp_collidable_player, true)
position_stage = _ATTACK_TG.teleport
image_alpha = 0
timeout = 0 //на всякий случай
hurt_timeout = 0 // на всякий случай
alarm_set(0, -1)
alarm_set(1, -1)
alarm_set(2, -1)

for (var i = 0; i < ds_list_size(states); i++)
	instance_destroy(ds_list_find_value(states, i))
ds_list_clear(states)

canMove = false
