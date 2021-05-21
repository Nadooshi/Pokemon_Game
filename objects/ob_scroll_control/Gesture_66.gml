/// @desc

is_drag = point_in_rectangle(
	event_data[? "posX"], event_data[? "posY"],
	camX, camY,
	camX + view_w, camY + view_h
)

if is_drag
	dragY = event_data[? "guiposY"]
