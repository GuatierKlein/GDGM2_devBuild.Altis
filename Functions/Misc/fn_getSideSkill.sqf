params["_side"];

private _res = 0;

switch (_side) do {
	case east: { _res = GDGM_OPFOR_skill };
	case west: { _res = GDGM_BLUFOR_skill };
	case independent: { _res = GDGM_IND_skill };
	default { };
};

_res;