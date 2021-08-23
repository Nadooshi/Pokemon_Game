/// @desc
if ai_control = cmp_control_ai
	exit
x += event_data[? "posX" ] - dragX
y += event_data[? "posY" ] - dragY

dragX = event_data[? "posX"]
dragY = event_data[? "posY"]

