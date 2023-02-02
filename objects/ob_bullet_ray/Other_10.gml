/// @desc Init

x1 = x
y1 = y
x2 = x1 + lengthdir_x(length, direction)
y2 = y1 + lengthdir_y(length, direction)

event_inherited();

count = length / 8
_x = lengthdir_x(8, direction)
_y = lengthdir_y(8, direction)

if ds_exists(action, ds_type_map) {
	var sprites = array_create(2)
	sprites[0] = asset_get_index("sp_particle_elemental" + string(action[? "element"]))
	sprites[1] = asset_get_index("sp_particle_elemental" + string(action[? "material"]))

	for (var i=0; i < count; i++)
		sc_particle_fx_bullet(x1 + _x*i, y1 + _y*i, sprites, 1, 1, 0.5, 1)
}

init = true
