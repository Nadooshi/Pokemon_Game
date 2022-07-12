/// @desc Do damage

var _d = 0
var _bullet = id
var _p = damage_period
var _el1 = action[? "material"]
var _el2 = action[? "element"]

with ob_player {
	_d = distance_to_object(other)
	if _d <= other.radius {
		if sc_check_affect(_bullet.pokemon_id, id, _bullet.action[? "affect"])
		if sc_check_accuracy(_bullet, id, _bullet.action)
		if (_bullet.action[? "tgTo"] & position_stage) != 0 
		with instance_create_layer(x, y + 12, "Particles", ob_damage_area) {
			ds_map_copy(action, _bullet.action)
			radius = 4
			pokemon_id = _bullet.pokemon_id
			hurt_time = _bullet.hurt_time
			action[? "dmg_element"] = _bullet.action[? "dmg_element"] / _bullet.action[? "range"] / (frames_rate / _p)
			action[? "dmg_material"] = _bullet.action[? "dmg_material"] / _bullet.action[? "range"] / (frames_rate / _p)
			damage_mod = _bullet.damage_mod
			accuracy_mod = _bullet.accuracy_mod
			image_blend =  _bullet.image_blend
			timeout = 1
		}
	}
	sc_apply_aura(_el1, _el2, other.radius * 1.5)
}

alarm_set(0, damage_period)
