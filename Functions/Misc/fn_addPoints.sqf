params["_side","_points"];

switch (_side) do {
	case west: {
		if(GDGM_BLUFOR_supplies + _points > -100) then {
			GDGM_BLUFOR_supplies = GDGM_maxSupply min (GDGM_BLUFOR_supplies + _points);
		} else {
			GDGM_BLUFOR_supplies = 0;
		};
	};
	case east: {
		if(GDGM_OPFOR_supplies + _points > -100) then {
			GDGM_OPFOR_supplies = GDGM_maxSupply min (GDGM_OPFOR_supplies + _points);
		} else {
			GDGM_OPFOR_supplies = 0;
		}; 
	};
	case independent: {
		if(GDGM_IND_supplies + _points > -100) then {
			GDGM_IND_supplies = GDGM_maxSupply min (GDGM_IND_supplies + _points);
		} else {
			GDGM_IND_supplies = 0;
		}; 
	};
};