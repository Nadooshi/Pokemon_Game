function sc_apply_aura(element_1, element_2){
	// for ob_pokemon
if is_undefined(element_1) or is_undefined(element_2)
	exit;

var _poke_in_aura = collision_circle(x,y,45,ob_player,false,true)
with _poke_in_aura {
	if ds_list_size(in_aura) <= 0 {
		if element_1 != _ELEMENTAL.none 
			ds_list_add(in_aura, element_1)
		if element_2 != _ELEMENTAL.none 
			ds_list_add(in_aura, element_2)
		return true
	}	
	for (var i=0; i<ds_list_size(in_aura); i++){
		if element_1 != _ELEMENTAL.none and element_1 != in_aura[| i] {
			ds_list_add(in_aura, element_1)
			break;
		}
		if element_2 != _ELEMENTAL.none and element_2 != in_aura[| i]
			ds_list_add(in_aura, element_2)
	}
}


}