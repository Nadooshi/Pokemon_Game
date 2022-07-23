/// @desc
alarm_set(0, frames_rate * 5) // 5 sec
alarm_set(1, time_refresh_aura)
tg_dir = -1
c_dir = direction
//=============================
#region fake action
fog_action = ds_map_create()
fog_active = ds_map_create()
fog_active[? "name"] = "stun"
fog_active[? "state"] = _ABILITY_STATE.confusion
fog_active[? "in_state"] = _ABILITY_STATE.none
fog_active[? "biome"] = _ELEMENTAL.none
fog_active[? "state_time"] = 2
fog_active[? "state_value"] = 75
fog_action[? "active"] = fog_active
#endregion
//==============================