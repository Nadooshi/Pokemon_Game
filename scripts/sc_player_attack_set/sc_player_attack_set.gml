function sc_player_attack_set() {


	if doActionNum < 0 exit

	var _a_map = action_list[| doActionNum]
	_a_map[? "num"] = doActionNum

	if not ds_exists(_a_map, ds_type_map) exit
	sc_canMove(false)

	switch (_a_map[? "type"]) {
		case _ATTACK_TYPE.lunge:
			sc_player_stop_set()
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_lunge)
			direction = point_direction(x, y+12, tgX, tgY+12)
			tgAngle = direction
			moveSpeed = pokemon_map[? "ap"] * 0.66
			attack_ob_id.timeout = frames_rate * 0.1 * _a_map[? "range"]
			frameSpeed = 0
			damage_mod = melee_damage_mod
			sc_set_behaviour(sc_player_attack_lunge)
			break
		case _ATTACK_TYPE.range:
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_range)
			direction = point_direction(x, y+12, tgX, tgY+12)
			tgAngle = direction
			sc_player_stop_set()
			frameSpeed = 0
			damage_mod = range_damage_mod
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break
		case _ATTACK_TYPE.wave:
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_wave)
			direction = point_direction(x, y+12, tgX, tgY+12)
			tgAngle = direction
			sc_player_stop_set()
			frameSpeed = 0
			damage_mod = range_damage_mod
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break
		case _ATTACK_TYPE.melee:
			direction = point_direction(x, y+12, tgX, tgY+12)
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_melee)
			attack_ob_id.direction = direction
			tgAngle = direction
			sc_player_stop_set()
			frameSpeed = 0
			damage_mod = melee_damage_mod
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break		
		case _ATTACK_TYPE.front:
			direction = point_direction(x, y+12, tgX, tgY+12)
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_front)
			attack_ob_id.direction = direction
			tgAngle = direction
			timeout = 10
			sc_player_stop_set()
			frameSpeed = 0
			damage_mod = melee_damage_mod
			sc_set_behaviour(sc_player_attack_front)
			// set direction image
			sc_player_move()
			// little lunge
			oX = x
			oY = y
			x = x + cos(degtorad(-direction)) * -2
			y = y + sin(degtorad(-direction)) * -2
			break
		case _ATTACK_TYPE.mortar:
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_mortar)
			direction = point_direction(x, y+12, tgX, tgY+12)
			tgAngle = direction
			sc_player_stop_set()
			frameSpeed = 0
			damage_mod = range_damage_mod
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break
		case _ATTACK_TYPE.aura:
			direction = 270
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_aura)
			attack_ob_id.direction = 0
			tgAngle = direction
	//		timeout = 10
			sc_player_stop_set()
			frameSpeed = 0
			damage_mod = range_damage_mod
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break
		case _ATTACK_TYPE.pool:
			direction = point_direction(x, y+12, tgX, tgY+12)
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_pool)
			attack_ob_id.direction = direction
			tgAngle = direction
			sc_player_stop_set()
			frameSpeed = 0
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break
		case _ATTACK_TYPE.cloud:
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_cloud)
			direction = point_direction(x, y+12, tgX, tgY+12)
			tgAngle = direction
			sc_player_stop_set()
			frameSpeed = 0
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break
		case _ATTACK_TYPE.barrier:
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_barrier)
			direction = point_direction(x, y+12, tgX, tgY+12)
			tgAngle = direction
			sc_player_stop_set()
			frameSpeed = 0
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break
		case _ATTACK_TYPE.swoop:
			sc_player_stop_set()
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_swoop)
			direction = point_direction(x, y+12, tgX, tgY+12)
			tgAngle = direction
			moveSpeed = pokemon_map[? "ap"] * 0.66

			event_perform(ev_other, ev_user5) // swoop
			damage_mod = melee_damage_mod
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break
		case _ATTACK_TYPE.ray:
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack_ray)
			direction = point_direction(x, y+12, tgX, tgY+12)
			tgAngle = direction
			sc_player_stop_set()
			frameSpeed = 0
			damage_mod = range_damage_mod
			sc_set_behaviour(sc_player_attack_wait_anim)
			// set direction image
			sc_player_move()
			break
		default:
			sc_player_stop_set()
			attack_ob_id = instance_create_layer(x, y, "Particles", ob_attack)

	}
	with attack_ob_id {
		ds_map_copy(action, _a_map)
		pokemon_id = other.id
		damage_mod = other.damage_mod
		accuracy_mod = other.accuracy_mod
		_z = other._z
		sprite_index = asset_get_index(_a_map[? "anim"])
		image_blend = sc_make_attack_colour(_a_map)
	}
	if _a_map[? "repeatable"] = true //true = no repeat
		_a_map [? "cooldown"] = disposable_action_cooldown
		
	sc_gain_exp(_a_map, act_exp.use, 0, id)
	sc_logging_action(id, _a_map)
}


