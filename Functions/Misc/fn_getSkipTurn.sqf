params["_side"];

private _res = false;

switch (_side) do {
	case west: { _res = GDGM_BLUFOR_skipTurn };
	case east: { _res = GDGM_OPFOR_skipTurn };
	case independent: { _res = GDGM_IND_skipTurn };
	default { };
};

_res;