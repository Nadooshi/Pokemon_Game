/// @desc

var _colcount = 7
var _rowcount = 3
var _slotcount = 0
var _slotw = sprite_get_width(sp_items)
var _w = (invBack.sprite_width - _slotw * _colcount) / _colcount

for (var _y = 0; _y < _rowcount; _y++)
for (var _x = 0; _x < _colcount; _x++) {
	if _slotcount > trainer_inv_size
		break
		
	with instance_create_layer(
			invBack.x + (_slotw + _w)*_x  + _w,
			invBack.y + (_slotw + _w)*_y  + _w, 
			"Frames", ob_inv_slot
		) {
		index = _slotcount++
		with instance_create_layer(x, y, "Items", ob_inv_drag) {
			index = other.index
			image_index = index
			sc_place_center(other)
		}
	}
	
}
