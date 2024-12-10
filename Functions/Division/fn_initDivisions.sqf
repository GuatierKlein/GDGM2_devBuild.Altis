//west 
if(count GDGM_BLUFOR_divisionsModels > 0) then {
	for [{private _i = 0}, {_i < GDGM_BLUFOR_startingDivs}, {_i = _i + 1}] do {
		private _divisionModel = selectRandom GDGM_BLUFOR_divisionsModels;
		_divisionModel call GDGM_fnc_division;
	};
};

//east 
if(count GDGM_OPFOR_divisionsModels > 0) then {
	for [{private _i = 0}, {_i < GDGM_OPFOR_startingDivs}, {_i = _i + 1}] do {
		hint str GDGM_OPFOR_divisionsModels;
		private _divisionModel = selectRandom GDGM_OPFOR_divisionsModels;
		_divisionModel call GDGM_fnc_division;
	};
};

//ind 
if(count GDGM_IND_divisionsModels > 0) then {
	for [{private _i = 0}, {_i < GDGM_IND_startingDivs}, {_i = _i + 1}] do {
		private _divisionModel = selectRandom GDGM_IND_divisionsModels;
		_divisionModel call GDGM_fnc_division;
	};
};
