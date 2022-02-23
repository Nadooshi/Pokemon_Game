/// @desc

move_component_index = sc_composed_add_component(cmp_moving)
//sc_composed_add_component(cmp_control_keyb)
sc_composed_add_component(cmp_collidable_player)

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
canMove = true
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
power_reg = 0.2

health_cur = 0
health_max = 0
health_reg = 0.3

hurt_timeout = 0  // timeout after taking damage (sec)
hurt_cur = 0
hurt_reg = 0.3


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

trainer = noone
position_stage = _ATTACK_TG.ground

delayed_bullet = ds_list_create()
states = ds_list_create()

passive_state1 = noone
passive_state2 = noone
alarm_set(0,0)
alarm_set(1,0)
alarm_set(3, frames_rate) // 60

in_biome = ds_list_create()
prev_in_biome = ds_list_create()
courage_cur = 100
courage_threshold = random(80)+10

mark_hostile = instance_create_layer(x,y, "Game", ob_mark_hostile)
effect_bullet = instance_create_layer(x, y, "Particles", ob_effect_damage)
effect_bullet.p_parent = id

animation_set = array_create(2, 0)
animation_set[0] = {
	anim : "",
	main_stat : -1,
	stat_term : -1,
	bio_term : -1,
	time : -1
}
animation_set[1] = {
	anim : "",
	main_stat : -1,
	stat_term : -1,
	bio_term : -1,
	time : -1
}


target = ob_cursor
