params["_side"];

private _reserves = 0;

if(typeName _side == "SIDE") then { 
	switch (_side) do {
		case west: {_reserves = GDGM_BLUFOR_reserves };
		case east: {_reserves = GDGM_OPFOR_reserves };
		case independent: {_reserves = GDGM_IND_reserves };
	};
} else {
	private _division = GDGM_allDivisions get _side;
	_reserves = _division get "reserves";
};



_reserves;