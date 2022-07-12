/// @desc Init
var _tags = ""

if sprite_exists(sprite_index) {
	_tags = string(asset_get_tags(sprite_index, asset_sprite))
	p_looped = string_pos("loop", _tags) > 0
	p_4dir   = string_pos("4_dir", _tags) > 0
	p_stable = string_pos("stab", _tags) > 0
	p_ray	 = string_pos("ray", _tags) > 0
	
	sprite_speed = 1 / (frames_rate / sprite_get_speed(sprite_index))
}

// normal anim
frame_count = sprite_get_number(sprite_index)
stop_frame = frame_count
image_angle = direction

// 4-directional
if p_4dir {
	frame_count /= 4
	for (var i=0; i<4; i++)
		dirframe[i] = frame_count * i

	start_frame = dirframe[dir]
	stop_frame = start_frame + frame_count 
	image_angle = 0
}

// stable
if p_stable
	image_angle = 0

// ray (repeatable)
if p_ray {
	p_looped = true
	start_value = 0
	end_value = 1.5
	mid_value = start_value
	fraction = 0.1
	phase = 0
	init_timeout = timeout
}

image_index = start_frame
