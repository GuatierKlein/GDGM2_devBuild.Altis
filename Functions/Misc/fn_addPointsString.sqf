params["_side","_points"];

switch (_side) do {
	case "WEST": {
		if(GDGM_BLUFOR_supplies + _points > -100) then {
			GDGM_BLUFOR_supplies = GDGM_BLUFOR_supplies + _points;
		} else {
			GDGM_BLUFOR_supplies = 0;
		};
	};
	case "EAST": {
		if(GDGM_OPFOR_supplies + _points > -100) then {
			GDGM_OPFOR_supplies = GDGM_OPFOR_supplies + _points;
		} else {
			GDGM_OPFOR_supplies = 0;
		}; 
	};
	case "GUER": {
		if(GDGM_IND_supplies + _points > -100) then {
			GDGM_IND_supplies = GDGM_IND_supplies + _points;
		} else {
			GDGM_IND_supplies = 0;
		}; 
	};
};

call GDGM_fnc_updateLogiData;