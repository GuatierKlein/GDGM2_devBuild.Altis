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
		[format ["starting turn for %1", str _x]] call GDGM_fnc_logRPT;
		[format ["supplies before turn for %1 : %2", str _x, [_x] call GDGM_fnc_getPoints]] call GDGM_fnc_logRPT;
		[format ["reserves before turn for %1 : %2", str _x, [_x] call GDGM_fnc_getReserves]] call GDGM_fnc_logRPT;

		[format ["situation before supply tick"]] call GDGM_fnc_logRPT;
		[format ["supplies for east : %1", [east] call GDGM_fnc_getPoints]] call GDGM_fnc_logRPT;
		[format ["supplies for east : %1", [independent] call GDGM_fnc_getPoints]] call GDGM_fnc_logRPT;
		[format ["supplies for east : %1", [west] call GDGM_fnc_getPoints]] call GDGM_fnc_logRPT;

		[] spawn GDGM_fnc_nodeGarbageCollector;
		[] call GDGM_fnc_tickFrontlineSupplies;
		[] call GDGM_fnc_tickSupply;

		[format ["situation after supply tick"]] call GDGM_fnc_logRPT;
		[format ["supplies for east : %1", [east] call GDGM_fnc_getPoints]] call GDGM_fnc_logRPT;
		[format ["supplies for ind : %1", [independent] call GDGM_fnc_getPoints]] call GDGM_fnc_logRPT;
		[format ["supplies for west : %1", [west] call GDGM_fnc_getPoints]] call GDGM_fnc_logRPT;

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

		[format ["supplies after turn for %1 : %2", str _x, [_x] call GDGM_fnc_getPoints]] call GDGM_fnc_logRPT;
		[format ["reserves after turn for %1 : %2", str _x, [_x] call GDGM_fnc_getReserves]] call GDGM_fnc_logRPT;

		sleep (GDGM_timeBetweenAITicks);	
		// sleep 5;	
	} forEach _sides;	
	// sleep 0;
	_sides = GDGM_sides + ([] call GDGM_fnc_getAttackDivisions);
	_sides = _sides call BIS_fnc_arrayShuffle;
};