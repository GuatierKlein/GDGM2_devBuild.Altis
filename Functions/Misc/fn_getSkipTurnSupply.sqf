params["_side"];

private _res = false;

switch (_side) do {
	case west: { _res = GDGM_BLUFOR_skipSupplyTurn };
	case east: { _res = GDGM_OPFOR_skipSupplyTurn };
	case independent: { _res = GDGM_IND_skipSupplyTurn };
	default { };
};

_res;