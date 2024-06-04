params ["_side"];

private _res = 1;

switch (_side) do {
	case east: { _res = GDGM_OPFOR_cowardice };
	case west: { _res = GDGM_BLUFOR_cowardice };
	case independent: { _res = GDGM_IND_cowardice };
	default { };
};

_res;