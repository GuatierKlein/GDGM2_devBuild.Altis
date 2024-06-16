private _playerInSides = [false, false, false]; //east, west, indep
GDGM_eastRaidNb = 0;
GDGM_westRaidNb = 0;
GDGM_indRaidNb = 0;

waitUntil { sleep 60; GDGM_gracePeriodDone; };

while {true} do {
	//find which sides to create raid for
	private _allPlayers = call BIS_fnc_listPlayers;

	{
		switch (side _x) do {
			case east: { _playerInSides set [0, true] };
			case west: { _playerInSides set [1, true] };
			case independent: { _playerInSides set [2, true] };
			default { };
		};
		
	} forEach _allPlayers;

	//east 
	if(_playerInSides select 0 && GDGM_eastRaidNb < GDGM_maxRaidPerSide) then {
		[east] spawn GDGM_fnc_generateRaid;
		GDGM_eastRaidNb = GDGM_eastRaidNb + 1;
	};

	//west 
	if(_playerInSides select 1 && GDGM_westRaidNb < GDGM_maxRaidPerSide) then {
		[west] spawn GDGM_fnc_generateRaid;
		GDGM_westRaidNb = GDGM_westRaidNb + 1;
	};

	//indep 
	if(_playerInSides select 2 && GDGM_indRaidNb < GDGM_maxRaidPerSide) then {
		[independent] spawn GDGM_fnc_generateRaid;
		GDGM_indRaidNb = GDGM_indRaidNb + 1;
	};

	sleep 600;
};