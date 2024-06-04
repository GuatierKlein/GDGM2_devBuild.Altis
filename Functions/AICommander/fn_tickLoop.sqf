private _sides = GDGM_sides call BIS_fnc_arrayShuffle;
// GDGM_lanceria = false;

// waitUntil { GDGM_lanceria; };
// "IA lancées" remoteExec ["systemChat",0];

sleep (GDGM_AITimeBuffer);

while {true} do {
	{
		[_x, [_x] call GDGM_fnc_getReservesPerTurn] call GDGM_fnc_addReserves;
		[_x, [_x] call GDGM_fnc_getVehReservesPerTurn] call GDGM_fnc_addVehReserves;
		[] spawn GDGM_fnc_nodeGarbageCollector;
		[] call GDGM_fnc_tickSupply;
		[] call GDGM_fnc_tickFrontlineSupplies;

		if([_x] call GDGM_fnc_getSkipTurn) then {
			[_x, false] call GDGM_fnc_setSkipTurn;
			(str _x + " turn was skipped") remoteExec["systemChat",0];
			continue;
		};
		
		[_x] spawn GDGM_fnc_sideTick;
		sleep (GDGM_timeBetweenAITicks);	
		// sleep 5;	
	} forEach _sides;	
	// sleep 0;
};