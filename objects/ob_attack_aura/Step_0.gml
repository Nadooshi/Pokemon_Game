/// @desc 

if not init 
	event_perform(ev_other, ev_user0)

event_inherited()

if not instance_exists(bullet)
	exit
	
bullet.radius += d_radius

if ds_exists(action, ds_type_map) {
	var sprites = array_create(2)
	sprites[0] = asset_get_index("sp_particle_elemental" + string(action[? "element"]))
	sprites[1] = asset_get_index("sp_particle_elemental" + string(action[? "material"]))

	sc_particle_fx_pool(x, y, sprites, 1, 1, 0.5, 1, bullet.radius)
}

part_step = bullet.radius div 24
if o_part_step < part_step {
	o_part_step = part_step
	for (var i=0; i<part_count; i++) 
	with instance_create_layer(x, y, "Particles", ob_bullet_aura) {
		angle = 360/other.part_count * i
		x1 = other.x
		y1 = other.y
		d_radius = other.d_radius
		max_radius = other.max_radius
		sprite_index = asset_get_index(other.action[? "p_anim"])
		image_blend = other.image_blend
	}
}

