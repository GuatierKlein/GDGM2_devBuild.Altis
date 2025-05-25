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
	if(_side == "player") then { // player side reserves
		if(GDGM_player_reserves + _points > 0) then {
			GDGM_player_reserves = GDGM_player_maxReserves min (GDGM_player_reserves + _points);
		} else {
			//si pas assez de point on tape sur la faction
			private _rest = GDGM_player_reserves + _points;
			GDGM_player_reserves = 0;

			[GDGM_playerSide, _rest] call GDGM_fnc_addReserves;
		};
	} else {
		//division reserves
		private _division = GDGM_allDivisions get _side;
		_division set ["reserves", (0 max (( _division get "reserves") + _points)) min GDGM_maxReserves];
	};
};

