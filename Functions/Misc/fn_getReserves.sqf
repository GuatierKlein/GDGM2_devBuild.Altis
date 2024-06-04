params["_side"];

private _reserves = 0;

switch (_side) do {
	case west: {_reserves = GDGM_BLUFOR_reserves };
	case east: {_reserves = GDGM_OPFOR_reserves };
	case independent: {_reserves = GDGM_IND_reserves };
};

_reserves;