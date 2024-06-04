hint "heli";
GDGM_heliModeEnabled = true;
private _ticksMod = 0;
private _tmpArray = [];

while {GDGM_heliModeEnabled} do {
	//raid spawn
	if(GDGM_heliRaid_nb < GDGM_maxHeliRaidNb) then {
		[GDGM_planeModePlayerSide] spawn GDGM_fnc_heliRaid_generateLogiRun;
	};

	sleep 120;
};

