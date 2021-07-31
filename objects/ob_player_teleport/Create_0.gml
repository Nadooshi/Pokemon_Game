/// @desc

_z = 48
init = false
image_alpha = 1
sprite_index = sprite_id
mask_index = sp_pokeworld_110
image_xscale = pokemon_id.image_xscale * 1.2
image_yscale = pokemon_id.image_yscale * 1.2
y = pokemon_id.y - _z

counter = 0

colors = [ $88AAFF, $FFAA88 ]

dragX = 0
dragY = 0
is_drag = false

timeout = 5 // sec

text = instance_create_layer(x, y-12, "Particles", ob_particle_text)
with text {
	d_alpha = 0
	alpha = 1
	phase = 2
	vspeed = 0
}
