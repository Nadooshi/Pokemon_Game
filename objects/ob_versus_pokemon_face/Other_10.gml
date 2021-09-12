/// @desc

event_inherited()

var layer_gamma = [
	1,
	0.9,
	0.8,
	0.7
]
var layer_scale = [
	0.66,
	1,
	1.5,
	2
]

if not is_undefined(map)
if ds_exists(map, ds_type_map) {
	image_index = map[? parameter_name] + 0.01
	image_blend = make_color_hsv(0, 0, 255 * layer_gamma[map[? "size"]]);
	image_xscale = layer_scale[map[? "size"]] * sign(image_xscale)
	image_yscale = layer_scale[map[? "size"]]
	x = xstart - (abs(sprite_width) - sprite_get_width(sprite_index)) * 0.5
	y = ystart - (sprite_height - sprite_get_height(sprite_index))

}
