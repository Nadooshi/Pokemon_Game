/// @desc state_mod_damage(id)

event_inherited()

image_index = _ABILITY_STATE.powerup;
period = 30;
hit_count = 1;
modify = 0

state_mod_damage = function (_id) {
	with _id {
		modify = ((ds_map_find_value(action[? "active"], "state_value") *0.01) + 1) + action[? "lvlup_mod"]

		if pokemon_id.damage_mod < modify
			pokemon_id.damage_mod = modify
	}
}
