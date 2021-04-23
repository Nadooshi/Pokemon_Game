function sc_apply_aura(element_1, element_2){
	// for ob_pokemon
if is_undefined(element_1) or is_undefined(element_2)
	exit;

var _poke_in_aura = ds_list_create();
var _sz = collision_circle_list(x, y, 45, ob_player, false, true, _poke_in_aura, false);

for (var i=0; i<_sz; i++) 
with _poke_in_aura[| i] {
	if element_1 != _ELEMENTAL.none
	if ds_list_find_index(in_biome, element_1) = -1 
		ds_list_add(in_biome, element_1)
	if element_2 != _ELEMENTAL.none 
	if ds_list_find_index(in_biome, element_2) = -1 
		ds_list_add(in_biome, element_2)
}


}