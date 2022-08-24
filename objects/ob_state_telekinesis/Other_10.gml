/// @desc 
if not instance_exists(pokemon_id){
	instance_destroy()
	exit;
}


if pokemon_id = pokemon_id_attack
	instance_destroy()

//damage = ds_map_find_value(action[? "active"], "state_value");
dist = point_distance(pokemon_id.x, pokemon_id.y, pokemon_id_attack.x, pokemon_id_attack.y)
attract_dir = point_direction(pokemon_id.x, pokemon_id.y, pokemon_id_attack.x, pokemon_id_attack.y)
attract_speed = 3
init_timeout = dist / attract_speed
timeout = init_timeout

sc_logging_state_cursed(pokemon_id, name, "captured by " + pokemon_id_attack.pokemon_map[? "title"])

with pokemon_id {
	instance_change(ob_player_swoop, false)
	sc_composed_remove_component(cmp_collidable_player, true)
	event_perform_object(ob_player_swoop, ev_create, 0)
	doActionNum = -1
	sc_player_stop_set()
}

var _t = 60 * 0.1 * action[? "range"]
var _d = dist / 3 + 8
upgea = min(_t, _d)
