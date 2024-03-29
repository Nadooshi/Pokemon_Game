/// @desc 

//if not instance_exists(pokemon_id) exit;

var _d = 0

ds_list_clear(just_damaged) // list to be damaged

var _action = action
var _damage_area = id
var _ok = true

_action[? "lastX"] = x
_action[? "lastY"] = y
_action[? "dir"] = direction
_action[? "hurt_time"] = hurt_time

if sc_does_exist(accuracy_done_for)
if ds_list_find_index(last_damaged, accuracy_done_for) = -1 
	ds_list_add(just_damaged, accuracy_done_for)

with ob_player
if ds_list_find_index(other.just_damaged, id) = -1 
if ds_list_find_index(other.last_damaged, id) = -1 {
	_d = distance_to_point(other.x, other.y)
	if _d <= other.radius {
		//if hurt_timeout <= 0
		if (_action[? "tgTo"] & position_stage) != 0 
		if sc_check_affect(other.pokemon_id, id, _action[? "affect"]) {
			if sc_check_accuracy(other.id, id, _action) 
				ds_list_add(other.just_damaged, id)
			else
				ds_list_add(other.last_damaged, id)
			if _action[? "type"] = _ATTACK_TYPE.front  // hit once
				break
		}
	}
}


for (var i=0; i<ds_list_size(just_damaged); i++)
	ds_list_add(last_damaged, just_damaged[| i])
	
// do chain damage
if ds_list_size(just_damaged) > 0
if _action[? "bullet_phys"] = _BULLET_PH.chain {
	chain_dmg_target = sc_chain_damage()
	if sc_does_exist(chain_dmg_target) {
		with instance_create_layer(chain_dmg_target.x, chain_dmg_target.y, "Particles", ob_pivot) {
			ds_map_copy(action, other.action)
			action[? "type"] = _ATTACK_TYPE.pivot
			action[? "range"] *= 0.5
			pokemon_id = other.pokemon_id
			hurt_time = other.hurt_time
			timeout = 1
		}
	}
}

// do damage
for (var i=0; i<ds_list_size(just_damaged); i++) 
with just_damaged[| i] {
	if _action[? "delay"] = 0 {
		// deal damage
		hurt_timeout = other.hurt_time
		sc_deal_damage(_action, other.pokemon_id)
		
	} else {   // do delayed damage
		_ok = true
		var k = 0
		while not is_undefined(delayed_bullet[| k]) {
			if instance_exists(delayed_bullet[| k]) {
				if delayed_bullet[| k].action[? "name"] = _action[? "name"] {
					_ok = false
					break
				}
				k++
			} else {
				ds_list_delete(delayed_bullet, k)
				continue
			}
		}
		if _ok {
			var _bullet = instance_create_layer(x, y, "Game", ob_bullet_delayed)
			with _bullet {
				pokemon_id_damaged = other.id
				pokemon_id_attack = _damage_area.pokemon_id
				ds_map_copy(action, _action)
				timeout = action[? "delay"]   // in seconds
				hurt_time = _damage_area.hurt_time
				damage_mod = other.damage_mod
				image_blend  = _damage_area.image_blend
			}
			ds_list_add(delayed_bullet, _bullet)
		}
	}
}

	
if timeout>0 {
	timeout--
	if timeout<=0 
		instance_destroy()
}

