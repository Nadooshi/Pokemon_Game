/// @desc 

if not init
	event_perform(ev_other, ev_user0)

counter++

event_inherited()

if script_exists(scBehaviour) or is_method(scBehaviour)
	if script_execute(scBehaviour)
		succeeded_behaviour = scBehaviour

//else
//	sc_player_stop_set()


if hurt_timeout > 0 { 
	hurt_timeout -= dTime
}

if canMove
if attack_warmup <= 0
if floor(power_cur) < power_max {	// recover power
	power_cur += power_reg
} else {
	power_cur = power_max
	if health_cur < health_max		// slow recover health from full power
		health_cur += (health_reg/10)
}

if hurt_cur > 0 {
	hurt_cur = max(0, hurt_cur - (hurt_reg + health_reg)) // recover half health after damage
	if health_cur < health_max
		health_cur += health_reg
}

if attack_warmup > 0 {
	attack_warmup -= dTime
	// charge is over
	if attack_warmup <= 0 {
		if object_index = ob_player_buried
			event_perform(ev_other, ev_user2)
		sc_player_attack_set()
		doActionNum = -1
	}
}

// courage
//courage_cur = 50 + cos(counter*0.005) * 50;
//courage_threshold = 50 + sin(counter*0.001) * 50;

