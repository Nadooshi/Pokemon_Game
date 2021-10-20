/// @desc 

// Inherit the parent event
event_inherited();

draw_primitive_begin_texture(pr_trianglestrip, tx)
for (var i=0; i<4; i++)
	draw_vertex_texture(v[i][0], v[i][1], v[i][2] + _du, v[i][3])
draw_primitive_end()
