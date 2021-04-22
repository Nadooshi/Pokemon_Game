/// @desc

// Inherit the parent event
event_inherited();

pokemon_id.shield = max(0, pokemon_id.shield - ds_map_find_value(action[? "active"], "state_value"))
