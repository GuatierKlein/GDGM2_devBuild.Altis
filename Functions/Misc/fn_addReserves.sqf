params["_side","_points"];

if(typeName _side == "SIDE") then {
	switch (_side) do {
		case west: {
			if(GDGM_BLUFOR_reserves + _points > 0) then {
				GDGM_BLUFOR_reserves = GDGM_maxReserves min (GDGM_BLUFOR_reserves + _points);
			} else {
				GDGM_BLUFOR_reserves = 0;
			};
		};
		case east: {
			if(GDGM_OPFOR_reserves + _points > 0) then {
				GDGM_OPFOR_reserves = GDGM_maxReserves min (GDGM_OPFOR_reserves + _points);
			} else {
				GDGM_OPFOR_reserves = 0;
			}; 
		};
		case independent: {
			if(GDGM_IND_reserves + _points > 0) then {
				GDGM_IND_reserves = GDGM_maxReserves min (GDGM_IND_reserves + _points);
			} else {
				GDGM_IND_reserves = 0;
			}; 
		};
	};
} else {
	private _division = GDGM_allDivisions get _side;
	_division set ["reserve", (0 max (( _division get "reserve") + _points)) min GDGM_maxReserves];
};

