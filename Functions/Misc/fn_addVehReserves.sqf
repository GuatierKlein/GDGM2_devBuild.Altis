// _amount = nb of [trucks, apcs, tanks, transport helos, combat aircrafts]
params["_side","_amount"];

if(typeName _side == "SIDE") then { 
	private _res = [_side] call GDGM_fnc_getVehReserves;
	for [{private _i = 0}, {_i < 5}, {_i = _i + 1}] do {
		_res set [_i, (_res select _i) + (_amount select _i)];
	};
} else {
	if(_side == "player") then { // player side reserves
		for [{private _i = 0}, {_i < 5}, {_i = _i + 1}] do {
			if((GDGM_player_vehReserves select _i) + (_amount select _i) >= 0) then {
				GDGM_player_vehReserves set [_i, (GDGM_player_vehReserves select _i) + (_amount select _i)];
			} else {
				// débordement sur faction
				private _rest = [0,0,0,0,0];
				_rest set [_i, (_amount select _i) + (GDGM_player_vehReserves select _i)];
				GDGM_player_vehReserves set [_i, 0];
				[GDGM_playerSide, _rest] call GDGM_fnc_addVehReserves;
			};
		};
	} else {
		//division reserves
		private _res = [_side] call GDGM_fnc_getVehReserves;
		private _division = GDGM_allDivisions get _side;
		_division set ["transportReserves", 0 max (( _division get "transportReserves") + (_amount select 0))];
		_division set ["heavyReserves", 0 max (( _division get "heavyReserves") + (_amount select 1))];
		_division set ["tankReserves", 0 max (( _division get "tankReserves") + (_amount select 2))];
	};
};





