/// @desc

move_component_index = sc_composed_add_component(cmp_moving)
sc_composed_add_component(cmp_collidable)

event_inherited()

enum d {
	Right,
	Up,
	Left,
	Down
}

enum _ATTACK_ERROR {
	nothing,
	no_power,
	warmup_not_ready,
	wrong_position,
	no_target
}

attack_error = _ATTACK_ERROR.nothing

pokemon_map = ds_map_create()
action_list = ds_list_create()

doMove = false
sc_canMove(true)
accel = 0

doActionNum = -1
lastActionNum = -1

dirframe[d.Right] = 0
dirframe[d.Up   ] = 2
dirframe[d.Left ] = 4
dirframe[d.Down ] = 6

dir = d.Right

frame = 0
frameSpeed = 0


tgAngle = 0
dAngle = 0
tgX = 0
tgY = 0 
tgDelta = 0  // +- distance
oX = 0
oY = 0
_z = 0

attack_ob_id = noone
scBehaviour = noone
succeeded_behaviour = noone
prev_behaviour = noone

control_component = cmp_control_ai
prev_control_component = cmp_control_ai

move_component_index = 0

selected = false
unselectables = 0

timeout = 0
counter = 0

power_max = 100
power_cur = 100
#macro power_regeneration 0.2
power_reg = power_regeneration
mod_max_power = 1

health_cur = 0
health_max = 0
#macro health_regeneration 0.3
health_reg = health_regeneration

hurt_timeout = 0  // timeout after taking damage (sec)
hurt_cur = 0
#macro hurt_degeneration 0.3
hurt_reg = hurt_degeneration


shield = 0 // for barrier state

attack_warmup = 0   // sec
damage_mod = 1 // умножение в sc_calculate_action_damage
range_damage_mod = 1 // превращается в damage_mod в sc_player_attack_set
melee_damage_mod = 1 // превращается в damage_mod в sc_player_attack_set
speed_mod = 0 // прибавление в sc_player_move_set
accuracy_mod = 0 //прибавление в sc_check_accuracy
dodge_mod = 0 //прибавление в sc_check_accuracy
parry_mod = 1

cur_exp = 0
frags = 0

moveSpeed = 0
maxSpeed = 0

on_surface_type = _SURF_TYPE.surf_solid
hab_maxSpeed_mod = 1 // множитель изменяет maxSpeed в sc_player_move_set

trainer = noone
position_stage = _ATTACK_TG.ground

delayed_bullet = ds_list_create()
states = ds_list_create()

passive_state1 = noone
passive_state2 = noone
alarm_set(0,1)
alarm_set(1,1)
alarm_set(3, frames_rate) // 60

clear_sky = true
in_biome = ds_list_create()
prev_in_biome = ds_list_create()
courage_cur = 100
courage_threshold = random(80)+10
fear_cur = 0

mark_hostile = instance_create_layer(x,y, "Game", ob_mark_hostile)
effect_bullet = instance_create_layer(x, y, "Particles", ob_effect_damage)
effect_bullet.p_parent = id

#region // animation_set
animation_set = ds_map_create()
animation_set [? "anim"] = ds_map_create()
animation_set [? "anim"][? "first"] = ""
animation_set [? "anim"][? "second"] = ""
animation_set [? "state_anim"] = ds_map_create()
animation_set [? "state_anim"][? "first"] = ""
animation_set [? "state_anim"][? "second"] = ""
animation_set [? "bio_anim"] = ds_map_create()
animation_set [? "bio_anim"][? "first"] = ""
animation_set [? "bio_anim"][? "second"] = ""
animation_set [? "main_stat"] = ds_map_create()
animation_set [? "main_stat"][? "first"] = -1
animation_set [? "main_stat"][? "second"] = -1
animation_set [? "stat_term"] = ds_map_create()
animation_set [? "stat_term"][? "first"] = -1
animation_set [? "stat_term"][? "second"] = -1
animation_set [? "biome_term"] = ds_map_create()
animation_set [? "biome_term"][? "first"] = -1
animation_set [? "biome_term"][? "second"] = -1
animation_set [? "time"] = ds_map_create()
animation_set [? "time"][? "first"] = -1
animation_set [? "time"][? "second"] = -1
animation_set [? "stat_name"] = ds_map_create()
animation_set [? "stat_name"][? "first"] = ""
animation_set [? "stat_name"][? "second"] = ""
animation_set [? "check_state"] = ds_map_create()
animation_set [? "check_state"][? "first"] = -1
animation_set [? "check_state"][? "second"] = -1
animation_set [? "check_bio"] = ds_map_create()
animation_set [? "check_bio"][? "first"] = -1
animation_set [? "check_bio"][? "second"] = -1
#endregion

target = ob_cursor
