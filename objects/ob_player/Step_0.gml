/// @desc 

if not init
	event_perform(ev_other, ev_user0)

counter++

event_inherited()

mark_hostile.visible = (trainer == player2_trainer)
mark_hostile.x = x
mark_hostile.y = y

if script_exists(scBehaviour) or is_method(scBehaviour)
	if script_execute(scBehaviour)
		succeeded_behaviour = scBehaviour

var mod_reg = 1
if ds_exists(in_biome, ds_type_list)
for (var i=0; i<ds_list_size(in_biome); i++) {
	var _coeff = 1
	_coeff *= sc_element_coeff(in_biome[| i], pokemon_map[? "elemental_type"])
	_coeff *= sc_element_coeff(in_biome[| i], pokemon_map[? "material_type"])
	if _coeff > 1
		mod_reg *= 1.5
	if _coeff < 1
		mod_reg *= 0.5
}

if hurt_timeout > 0 { 
	hurt_timeout -= dTime
}

if canMove
if attack_warmup <= 0
if floor(power_cur) < power_max {	// recover power
	power_cur += power_reg * mod_reg
}

if hurt_cur > 0 {
	hurt_cur = max(0, hurt_cur - (hurt_reg * mod_reg + health_reg)) // recover half health after damage
	if health_cur < health_max
		health_cur += health_reg * mod_reg
}

if hurt_timeout > 0 {		
	for (var i=0; i<ds_list_size(states); i++) // awake with hurt
	if states[| i].object_index == ob_state_lulling
		states[| i].hit_count = 0
}

if attack_warmup > 0 {
	attack_warmup -= dTime
	// charge is over
	if attack_warmup <= 0 {
		if object_index = ob_player_buried
			event_perform(ev_other, ev_user2)
		sc_player_attack_set()
		lastActionNum = doActionNum
		doActionNum = -1
	}
}

// process courage
if (counter mod t_process_courage) = 0
	sc_process_courage(mod_reg)
