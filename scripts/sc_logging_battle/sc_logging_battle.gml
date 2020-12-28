/// @arg initiator
/// @arg recipient
/// @arg agent
/// @arg parameter
/// @arg value
/// @arg result
function sc_logging_battle(argument0, argument1, argument2, argument3, argument4, argument5){
	var _subject	= argument0	// initiator pokemon
	var _object		= argument1 // recipient pokemon or another ob_player
	var _agent		= argument2 // action or ob_state
	var _parameter	= argument3 // health, speed, regen or other parameter
	var _value		= argument4 // damage, heal or other value
	var _result		= argument5 // 'damage', 'death', 'gain', 'loss' ...
	
	var _log = ""
	if _subject.trainer != _object.trainer
		var _relation = "hostile"
	else _relation = "friend"
	
	_log = "[" + date_time_string(date_current_datetime())+ "]: " +
	_object.pokemon_map[? "title"] + " is " +
	_result + " "+ _parameter + " " + string(_value) + " by " +
	_agent[? "name"] + " from " +
	_subject.pokemon_map[? "title"]
	
	//show_message(_log)
	
	ds_list_add(log_battle, _log)
	
	
	
}