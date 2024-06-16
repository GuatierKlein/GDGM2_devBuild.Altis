hint "plane";
GDGM_planeModeEnabled = true;
private _ticksMod = 0;
private _tmpArray = [];

waitUntil { sleep 60; GDGM_gracePeriodDone; };

while {GDGM_planeModeEnabled} do {
	//tick and threat decrease
	if(_ticksMod % 10 == 0) then {
		_ticksMod = 0;
		[east, -0.5] call GDGM_fnc_addThreatLevel;
		[west, -0.5] call GDGM_fnc_addThreatLevel;
		[independent, -0.5] call GDGM_fnc_addThreatLevel;
		[east, -1] call GDGM_fnc_addSpawnedPlanes;
		[west, -1] call GDGM_fnc_addSpawnedPlanes;
		[independent, -1] call GDGM_fnc_addSpawnedPlanes;
	};

	//check threatLevel
	private _opforThreat = [east] call GDGM_fnc_getThreatLevel;
	private _bluforThreat = [west] call GDGM_fnc_getThreatLevel;
	private _indThreat = [independent] call GDGM_fnc_getThreatLevel;
	private _opforPlanes = [east] call GDGM_fnc_getSpawnedPlanes;
	private _bluforPlanes = [west] call GDGM_fnc_getSpawnedPlanes;
	private _indPlanes = [independent] call GDGM_fnc_getSpawnedPlanes;

	//opfor
	private _vehReserves = [east] call GDGM_fnc_getVehReserves;
	if(_opforThreat > _opforPlanes && _vehReserves select 4 > 0) then {
		private _grp = createGroup [east ,true]; 
		for [{private _i = 0}, {_i < GDGM_airResponseCoef}, {_i = _i + 1}] do {
			[_grp, east, _tmpArray, true] spawn GDGM_fnc_spawnFighterPlane;
			sleep 1;
		}; 	
		private _player = call GDGM_fnc_getRandomPilot;
		private _wp = _grp addWaypoint [position _player, 150];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "AWARE";
		[east, 1] call GDGM_fnc_addSpawnedPlanes;
	};

	//blufor
	_vehReserves = [west] call GDGM_fnc_getVehReserves;
	if(_bluforThreat > _bluforPlanes && _vehReserves select 4 > 0) then {
		private _grp = createGroup [west ,true];
		for [{private _i = 0}, {_i < GDGM_airResponseCoef}, {_i = _i + 1}] do {
			[_grp, west, _tmpArray, true] spawn GDGM_fnc_spawnFighterPlane;
			sleep 1;
		}; 		
		private _player = call GDGM_fnc_getRandomPilot;
		private _wp = _grp addWaypoint [position _player, 150];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "AWARE";
		[west, 1] call GDGM_fnc_addSpawnedPlanes;
	};

	//ind
	_vehReserves = [independent] call GDGM_fnc_getVehReserves;
	if(_indThreat > _indPlanes && _vehReserves select 4 > 0) then {
		private _grp = createGroup [independent ,true]; 
		for [{private _i = 0}, {_i < GDGM_airResponseCoef}, {_i = _i + 1}] do {
			[_grp, independent, _tmpArray, true] spawn GDGM_fnc_spawnFighterPlane;
			sleep 1;
		}; 	
		private _player = call GDGM_fnc_getRandomPilot;
		private _wp = _grp addWaypoint [position _player, 150];
		_wp setWaypointType "SAD";
		_wp setWaypointBehaviour "AWARE";
		[independent, 1] call GDGM_fnc_addSpawnedPlanes;
	};

	//raid spawn
	if(GDGM_planeRaid_nb < GDGM_maxPlaneRaidNb) then {
		[] spawn GDGM_fnc_planeRaid_generateRaid;
	};

	//tick increase
	_ticksMod = _ticksMod + 1;
	sleep 120;
};

