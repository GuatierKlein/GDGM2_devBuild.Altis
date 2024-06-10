params["_side", "_value"];

switch (_side) do {
	case west: { GDGM_BLUFOR_skipSupplyTurn = _value};
	case east: { GDGM_OPFOR_skipSupplyTurn = _value};
	case independent: { GDGM_IND_skipSupplyTurn = _value};
	default { };
};
