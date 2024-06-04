params["_side"];

private _reserves = [];

switch (_side) do {
	case west: {_reserves = GDGM_BLUFOR_vehReservesIncome };
	case east: {_reserves = GDGM_OPFOR_vehReservesIncome };
	case independent: {_reserves = GDGM_IND_vehReservesIncome };
};

_reserves;