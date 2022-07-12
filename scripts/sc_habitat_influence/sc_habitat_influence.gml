function sc_habitat_influence(_habitat, _surfase_type){
	
switch _surfase_type {
	case _SURF_TYPE.surf_solid:{ // default
		if _habitat = _HABITAT.water
			hab_maxSpeed_mod = 0.3
		if _habitat = _HABITAT.ground
			hab_maxSpeed_mod = 1
		if _habitat = _HABITAT.amphibian
			hab_maxSpeed_mod = 1
	}
	break;
	case _SURF_TYPE.surf_liquid: {
		if _habitat = _HABITAT.water
			hab_maxSpeed_mod = 1
		if _habitat = _HABITAT.ground
			hab_maxSpeed_mod = 0.3
		if _habitat = _HABITAT.amphibian
			hab_maxSpeed_mod = 1
	}
	break;
	case _SURF_TYPE.surf_deepLiquid: { // нет объекта
		if _habitat = _HABITAT.water
			hab_maxSpeed_mod = 1
		if _habitat = _HABITAT.ground
			hab_maxSpeed_mod = 0.1
		if _habitat = _HABITAT.amphibian
			hab_maxSpeed_mod = 0.5
	}
	break;
	case _SURF_TYPE.surf_abbyss: { // яма пока ничего не делает
		if _habitat = _HABITAT.water
			hab_maxSpeed_mod = 1
		if _habitat = _HABITAT.ground
			hab_maxSpeed_mod = 1
		if _habitat = _HABITAT.amphibian
			hab_maxSpeed_mod = 1
	}
	break;
}

}