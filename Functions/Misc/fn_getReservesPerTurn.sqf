params["_side"];

private _reserves = 0;

switch (_side) do {
	case west: {_reserves = GDGM_BLUFOR_fixedReservesPerTurn };
	case east: {_reserves = GDGM_OPFOR_fixedReservesPerTurn };
	case independent: {_reserves = GDGM_IND_fixedReservesPerTurn };
};

_reserves;