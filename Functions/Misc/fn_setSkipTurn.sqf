params["_side", "_value"];

switch (_side) do {
	case west: { GDGM_BLUFOR_skipTurn = _value};
	case east: { GDGM_OPFOR_skipTurn = _value};
	case independent: { GDGM_IND_skipTurn = _value};
	default { };
};
