/// @arg initiator_id
/// @arg recipient_id
/// @arg action_map
/// @arg value
function sc_logging_damage(argument0, argument1, argument2, argument3){
	var _subject	= argument0	// initiator pokemon
	var _object		= argument1 // recipient pokemon or another ob_player
	var _action		= argument2 // action or ob_state
	var _value		= argument3 // damage, heal or other value
	
	var _log = ""
	if _value = 0 exit;
	
	if _subject.trainer != _object.trainer
		var _relation = "hostile"
	else _relation = "friend"
	
	if _object.trainer != -1 {
	
		_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_object.trainer[? "name"]) + "`s " +
		_object.pokemon_map[? "title"] + " (" + string(_object.id) + ") " + "is injured " + 
		string(_value) + " by " +
		_action[? "name"] + " from " + _relation + " " +
		_subject.pokemon_map[? "title"] + " (" + string(_subject.id) + ") "+ "...... " + _subject.pokemon_map[? "title"] + " exp gained: " + string(_value * poke_damage_exp) + "!"
		
		_subject.pokemon_map[? "battle_exp"] += (_value * poke_damage_exp)
		
	} else {
		_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_subject.trainer[? "name"]) + "`s " +
		_action[? "name"] + " impact at barrier."
	}
	
	show_debug_message(_log)
	ds_list_add(log_battle, _log)
}


///@arg iniciator
///@arg action_map
function sc_logging_action(argument0, argument1){
	var _subject	= argument0
	var _action		= argument1
	var _what_do	= ""
	var _exp_value = 1 * act_use_exp

	var _log = ""
	switch _action[? "type"] {
		case _ATTACK_TYPE.range:
		case _ATTACK_TYPE.wave:
		case _ATTACK_TYPE.mortar:
		case _ATTACK_TYPE.ray:{
			_what_do = " shoot "
			break;
		}
		case _ATTACK_TYPE.aura:
		case _ATTACK_TYPE.cloud:
		case _ATTACK_TYPE.pool:{
			_what_do = " spew "
			break;
		}
		case _ATTACK_TYPE.front:
		case _ATTACK_TYPE.melee:{
			_what_do = " hit "
			break;
		}
		case _ATTACK_TYPE.lunge:
		case _ATTACK_TYPE.swoop:{
			_what_do = " rush "
			break;
		}
		case _ATTACK_TYPE.barrier:
			_what_do = " install "
	}
	
	_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_subject.trainer[? "name"]) + "`s " +
	_subject.pokemon_map[? "title"] + " (" + string(_subject.id) + ")" + _what_do + " " + _action[? "name"] + " ...... action exp gained: " + string(_exp_value) + "!"

//	var _a = ds_list_find_index(_subject.action_list, _action)
	_action[? "battle_exp"]+= _exp_value
	show_debug_message(_log)
	
	ds_list_add(log_battle, _log)
}


///@arg iniciator_id
///@arg	recipient_id
///@arg	action_map
function sc_logging_miss(argument0, argument1, argument2){
	var _subject	= argument0
	var _object		= argument1
	var _action		= argument2
	var _exp_value = string(_action[? "damage"] * poke_dodge_exp)
	
	var _log = ""
	if _subject.trainer != _object.trainer
		var _relation = "hostile"
	else _relation = "friend"
	
	if _object.trainer != -1 {

	_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_object.trainer[? "name"]) + "`s " +
	_object.pokemon_map[? "title"] +  " (" + string(_object.id) + ") " +" dodged " +
	_subject.pokemon_map[? "title"] + " (" + string(_subject.id) + ") " + "`s " +
	_action[? "name"] + " ..... " + _object.pokemon_map[? "title"] + "exp gained: " + _exp_value + "!"
	
	} else {
		_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_subject.trainer[? "name"]) + "`s " +
		_action[? "name"] + " overpassed barrier."
	}
	
	show_debug_message(_log)
	
	ds_list_add(log_battle, _log)
		
}

///@arg iniciator_id
///@arg	recipient_id
///@arg	action_map
function sc_logging_death(argument0, argument1, argument2){
	var _subject	= argument0
	var _object		= argument1
	var _action		= argument2
	
	var _log = ""
	if _subject.trainer != _object.trainer
		var _relation = "hostile"
	else _relation = "friendly"
	
	if _object.trainer = -1 exit;
	var _name = is_undefined(_action[? "name"]) ? _action[? "active"][? "name"] : _action[? "name"]
	_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_object.trainer[? "name"]) + "`s " +
	_object.pokemon_map[? "title"] + " (" + string(_object.id) + ") " + " cannot continue the fight, as the " +
	_name +	" " + _relation + " of " +  
	_subject.pokemon_map[? "title"] + " (" + string(_subject.id) + ") " + " finish him."
	
	show_debug_message(_log)
	
	ds_list_add(log_battle, _log)
}

///@arg recipient_id
///@arg	txt_state_name
///@arg	txt_what_do
///@arg	txt_param_val
///@arg	value
function sc_logging_state_loses(argument0, argument1, argument2, argument3, argument4){
	var _object		= argument0
	var _state		= argument1
	var _what_do	= argument2
	var _parameter	= argument3
	var _value		= argument4

	if _object.trainer = -1 exit;

	var _log = ""
	_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_object.trainer[? "name"]) + "`s " +
	_object.pokemon_map[? "title"] + " (" + string(_object.id) + ") " + " is " +
	_what_do + " from " + 
	_state + " and loses " + _parameter + " by " + string(_value)
	
	show_debug_message(_log)
	
	ds_list_add(log_battle, _log)

}

///@arg recipient_id
///@arg	txt_state_name
///@arg	txt_what_do
///@arg	txt_param_val
///@arg	value
function sc_logging_state_rises(argument0, argument1, argument2, argument3, argument4){
	var _object		= argument0
	var _state		= argument1
	var _what_do	= argument2
	var _parameter	= argument3
	var _value		= argument4
	
	if _object.trainer = -1 exit;
	
	var _log = ""
	_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_object.trainer[? "name"]) + "`s " +
	_object.pokemon_map[? "title"] + " (" + string(_object.id) + ") " + " is " +
	_what_do + " from " + 
	_state + " and rise " + _parameter + " by " + string(_value)
	
	show_debug_message(_log)
	
	ds_list_add(log_battle, _log)

}

///@arg recipient_id
///@arg	txt_state_name
///@arg	txt_what_do
function sc_logging_state_cursed(argument0, argument1, argument2){
	var _object		= argument0
	var _state		= argument1
	var _what_do	= argument2

	if _object.trainer = -1 exit;

	var _log = ""
	_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_object.trainer[? "name"]) + "`s " +
	_object.pokemon_map[? "title"] + " (" + string(_object.id) + ") " +
	" was in a " + _state + " and " + _what_do
	
	show_debug_message(_log)
	
	ds_list_add(log_battle, _log)

}

///@arg recipient_id
///@arg	txt_state_name
///@arg	txt_what_do
///@arg	txt_param_val
///@arg	value
function sc_logging_state_powered(argument0, argument1, argument2, argument3, argument4){
	var _object		= argument0
	var _state		= argument1
	var _what_do	= argument2
	var _parameter	= argument3
	var _value		= argument4

	if _object.trainer = -1 exit;

	var _log = ""
	_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_object.trainer[? "name"]) + "`s " +
	_object.pokemon_map[? "title"] + " (" + string(_object.id) + ") " + 
	" а " + _state + " " + _what_do + " " + _parameter + ", and is now " + _value
	
	show_debug_message(_log)
	
	ds_list_add(log_battle, _log)
}

///@arg recipient_id
///@arg	txt_state_name
function sc_logging_state_over(argument0, argument1){
	var _subject	= argument0
	var _state		= argument1

	if _subject.trainer = -1 exit;

	var _log = ""
	_log = "[" + date_time_string(date_current_datetime())+ "]: " + string(_subject.trainer[? "name"]) + "`s " +
	_subject.pokemon_map[? "title"] + " (" + string(_subject.id) + ") " + " - " + _state + " no longer effect."
	
	show_debug_message(_log)
	
	ds_list_add(log_battle, _log)
}



