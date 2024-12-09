private _sides = GDGM_sides + keys GDGM_allDivisions;
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
			[_x, [_x] call GDGM_fnc_getReservesPerTurn] call GDGM_fnc_addReserves;
			[_x, [_x] call GDGM_fnc_getVehReservesPerTurn] call GDGM_fnc_addVehReserves;

			// if([_x] call GDGM_fnc_getSkipTurnSupply) then {
			// 	[_x, false] call GDGM_fnc_setSkipTurnSupply;
			// 	(str _x + " supply turn was skipped") remoteExec["systemChat",0];
			// } else {
			// 	[] call GDGM_fnc_tickSupply;
			// };
		
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
};