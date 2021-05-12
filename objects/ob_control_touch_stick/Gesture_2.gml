/// @desc

X = event_data[? "guiposX"]
Y = event_data[? "guiposY"]

var _inside = point_in_rectangle(
	X, Y, 
	0, display_get_gui_height() * 0.5,
	display_get_gui_width() * 0.5, display_get_gui_height()
)

if _inside {
	visible = true
}

