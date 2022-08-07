function sc_place_center(_inst){
	if instance_exists(_inst)
	if sprite_exists(_inst.sprite_index) {
		x = _inst.x + _inst.sprite_width  / 2
		y = _inst.y + _inst.sprite_height / 2
	}
}
