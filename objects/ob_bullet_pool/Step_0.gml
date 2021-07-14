/// @desc

var _drop_appear_period = 864 / radius

// new drop
if (timeout mod _drop_appear_period) = 0 {
	var _drop = ds_map_create()
	var _r = random(radius-4)
	var _a = random(360)
	_drop = {
		x: lengthdir_x(_r, _a),
		y: lengthdir_y(_r, _a),
		frame: 0,
	}
	
	_drop.x += x
	_drop.y += y
	
	ds_list_add(drops, _drop)
	
}

// process drops
for (var i=0; i<ds_list_size(drops); i++)
if is_struct(drops[| i]) {
	drops[| i].frame += (sprite_get_speed(sprite_index) / 60) * 0.5
	if drops[| i].frame >= image_number * 2 {
		delete drops[| i]
		ds_list_delete(drops, i)
	}
}

event_inherited();
