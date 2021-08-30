/// @desc 

// Inherit the parent event
event_inherited();
time_stat = ds_map_find_value(action[? "active"], "state_value")
damage = ds_map_find_value(action[? "active"], "state_time") * 18 // distance // 60 * 0.1 * 3
alarm[0] = period;

sc_logging_state_cursed(pokemon_id, name, "going to teleport" + " x" + string(ceil(pokemon_id.x)) + ", y" + string(ceil(pokemon_id.y)))

