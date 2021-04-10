function sc_set_barrier_target(){

var _en = noone
var _pl = []
var _ok = false

// place barrier between fleeing ally and enemy
var _tg = sc_find_nearest_target(id, _ATTACK_AFFECT.friend, 180)
if instance_exists(_tg) 
if _tg.courage_cur < _tg.courage_threshold {
	_en = sc_find_nearest_target(_tg)
	_ok = true
}
	
// between myself and enemy
if not _ok {
	_tg = id
	_en = sc_find_nearest_target(_tg)
}

if instance_exists(_en) {
	var _tgNeeded = true
	if sc_does_exist(target)
		_tgNeeded = not is_like(target, ob_fake_target)
	if _tgNeeded {
		_pl = sc_average_point([_en, _tg])
		target = instance_create_layer(_pl[0], _pl[1], "Game", ob_fake_target)
		target.parent = id
		target.group = [_en, _tg]
	}
	sc_set_behaviour(sc_ai_follow_target)
}


}
