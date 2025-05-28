private _sides = GDGM_sides + ([] call GDGM_fnc_getAttackDivisions);

_sides = _sides call BIS_fnc_arrayShuffle;
// GDGM_lanceria = false;

// waitUntil { GDGM_lanceria; };
// "IA lancées" remoteExec ["systemChat",0];

private _i = 0;
while {GDGM_AITimeBuffer > _i || GDGM_gracePeriodDone} do {
	_i = _i + 60;
	("Grace period, " + str (GDGM_AITimeBuffer - _i) + "s remaining") remoteExec ["systemChat",0];
	sleep 60;
};

"Grace period finished, simulation is starting" remoteExec["hint",0];
GDGM_gracePeriodDone = true;

while {true} do {
	{
		[] spawn GDGM_fnc_nodeGarbageCollector;
		[] call GDGM_fnc_tickFrontlineSupplies;
		[] call GDGM_fnc_tickSupply;

		if(typeName _x == "SIDE") then {
			//side tick
			if(_x == GDGM_playerSide) then {
				// Player side, add player income share
				["player", [_x] call GDGM_fnc_getReservesPerTurn * GDGM_player_incomeShare] call GDGM_fnc_addReserves;
				["player", [_x] call GDGM_fnc_getVehReservesPerTurn * GDGM_player_incomeShare] call GDGM_fnc_addVehReserves;
				[_x, [_x] call GDGM_fnc_getReservesPerTurn * (1 - GDGM_player_incomeShare)] call GDGM_fnc_addReserves;
				[_x, [_x] call GDGM_fnc_getVehReservesPerTurn * (1 - GDGM_player_incomeShare)] call GDGM_fnc_addVehReserves;
			} else {
				[_x, [_x] call GDGM_fnc_getReservesPerTurn] call GDGM_fnc_addReserves;
				[_x, [_x] call GDGM_fnc_getVehReservesPerTurn] call GDGM_fnc_addVehReserves;
			};
		
			if([_x] call GDGM_fnc_getSkipTurn) then {
				[_x, false] call GDGM_fnc_setSkipTurn;
				(str _x + " turn was skipped") remoteExec["systemChat",0];
			} else {
				[_x] spawn GDGM_fnc_sideTick;
			};
		} else {
			//division tick
			[_x] spawn GDGM_fnc_divisionTick;
		};

		sleep (GDGM_timeBetweenAITicks);	
		// sleep 5;	
	} forEach _sides;	
	// sleep 0;
	_sides = GDGM_sides + ([] call GDGM_fnc_getAttackDivisions);
	_sides = _sides call BIS_fnc_arrayShuffle;
};