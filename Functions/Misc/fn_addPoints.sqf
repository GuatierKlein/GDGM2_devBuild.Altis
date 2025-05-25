params["_side","_points"];

if(typeName _side == "SIDE") then {
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
} else {
	if(_side == "player") then { // player side supplies
		if(GDGM_player_supplies + _points > 0) then {
			GDGM_player_supplies = GDGM_player_maxSupply min (GDGM_player_supplies + _points);
		} else {
			//si pas assez de point on tape sur la faction
			private _rest = GDGM_player_supplies + _points;
			GDGM_player_supplies = 0;

			[GDGM_playerSide, _rest] call GDGM_fnc_addPoints;
		};
	} else {
		//division supplies
		// private _division = GDGM_allDivisions get _side;
		// _division set ["supplies", (0 max (( _division get "supplies") + _points)) min GDGM_maxSupply];
	};
};