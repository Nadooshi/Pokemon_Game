function sc_new_inv_item() {
	var result = ds_map_create()

	result[? "script"]	= noone
	result[? "sprite"]	= noone
	result[? "count"]	= 0
	result[? "name"]	= ""
	result[? "durability"]	= 0
	result[? "price"]	= 0

	return result



}
