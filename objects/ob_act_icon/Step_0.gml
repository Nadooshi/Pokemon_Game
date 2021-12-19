/// @desc
switch phase {
	case 0: alf+= 0.01
	break;
	case 1: alf-= 0.01
}
clamp(alf, 0, 1)
if alf < 0.02phase = 0 
if alf > 0.98 phase = 1 
