params["_side"];

private _res = 0;

switch (_side) do {
	case east: { _res = GDGM_OPFOR_moraleOffset };
	case west: { _res = GDGM_BLUFOR_moraleOffset };
	case independent: { _res = GDGM_IND_moraleOffset };
	default { };
};

_res;