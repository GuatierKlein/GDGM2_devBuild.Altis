params["_pos", "_toNode","_side","_bg", ["_isDivison", false], "_divisionName"];

//roads 
private _nearbyRoads = _pos nearRoads 450;
private _spawnPos = [];
private _road = objNull;
private _dir = 0;
private _spawnedMountedGrps = [];
private _posTo = _toNode getVariable "GDGM_position";
private _spawnedUnits = [];


//getout scanner 
[_spawnedMountedGrps,[_posTo select 0, _posTo select 1, 0], 500] spawn GDGM_fnc_getOutScanner;

//unit spawn
{
	switch (_x select 0) do {
		case "squad": {
			for [{private _i = 0}, {_i < _x select 1}, {_i = _i + 1}] do {
				private _grp = createGroup [_side ,true]; 

				_spawnPos = [ 
					_pos, //trouver une pos sure
					0, //min dist
					250, //max dist
					3, //object dist
					0, //water mode 0=no water
					1, //max grad between 0 and 1
					0, 
					[], 
				[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
				
				if(_spawnPos select 0 == 0 && _spawnPos select 1 == 0 ) then {continue};

				[_spawnPos, _grp, _side, _spawnedUnits, 7, "NONE", true] spawn GDGM_fnc_spawnSquad;
				sleep 2;
				_wp = _grp addWaypoint [[_posTo select 0, _posTo select 1, 0], 150];
				_wp setWaypointType "SAD";
				_wp setWaypointBehaviour "AWARE";
				_wp setwaypointcombatmode "YELLOW"; 
				_wp setWaypointCompletionRadius 50;

				sleep 5;
			};
		};
		case "apc": {
			for [{private _i = 0}, {_i < _x select 1}, {_i = _i + 1}] do {
				private _grp = createGroup [_side ,true]; 
				if(count _nearbyRoads != 0) then {
					_road = selectRandom _nearbyRoads;
					_spawnPos = getPos _road;
					_nearbyRoads = _nearbyRoads - [_road];
					private _info = getRoadInfo _road;
					_dir = (_info select 6) getDir (_info select 7);
				} else {
					_spawnPos = [ 
						_pos, //trouver une pos sure
						0, //min dist
						350, //max dist
						5, //object dist
						0, //water mode 0=no water
						0.33, //max grad between 0 and 1
						0, 
						[], 
					[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
				};

				if(_spawnPos select 0 == 0 && _spawnPos select 1 == 0 ) then {continue};

				[_spawnPos, _grp, _side, _spawnedUnits, false, _dir, true] spawn GDGM_fnc_spawnAPC;
				sleep 2;
				_wp = _grp addWaypoint [[_posTo select 0, _posTo select 1, 0], 150];
				_wp setWaypointType "SAD";
				_wp setWaypointBehaviour "SAFE";
				_wp setwaypointcombatmode "YELLOW"; 
				_wp setWaypointCompletionRadius 50;

				sleep 5;
			};
		};
		case "lightVeh": {
			for [{private _i = 0}, {_i < _x select 1}, {_i = _i + 1}] do {
				private _grp = createGroup [_side ,true]; 
				if(count _nearbyRoads != 0) then {
					_road = selectRandom _nearbyRoads;
					_spawnPos = getPos _road;
					_nearbyRoads = _nearbyRoads - [_road];
					private _info = getRoadInfo _road;
					_dir = (_info select 6) getDir (_info select 7);
				} else {
					_spawnPos = [ 
						_pos, //trouver une pos sure
						0, //min dist
						350, //max dist
						5, //object dist
						0, //water mode 0=no water
						0.33, //max grad between 0 and 1
						0, 
						[], 
					[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
				};

				if(_spawnPos select 0 == 0 && _spawnPos select 1 == 0 ) then {continue};

				[_spawnPos, _grp, _side, _spawnedUnits, true, _dir, true] spawn GDGM_fnc_spawnLightArmedVeh;
				sleep 2;
				_wp = _grp addWaypoint [[_posTo select 0, _posTo select 1, 0], 150];
				_wp setWaypointType "SAD";
				_wp setWaypointBehaviour "SAFE";
				_wp setwaypointcombatmode "YELLOW"; 
				_wp setWaypointCompletionRadius 50;

				sleep 5;
			};
		};
		case "Msquad": {
			for [{private _i = 0}, {_i < _x select 1}, {_i = _i + 1}] do {
				private _grp = createGroup [_side ,true]; 
				if(count _nearbyRoads != 0) then {
					_road = selectRandom _nearbyRoads;
					_spawnPos = getPos _road;
					_nearbyRoads = _nearbyRoads - [_road];
					private _info = getRoadInfo _road;
					_dir = (_info select 6) getDir (_info select 7);
				} else {
					_spawnPos = [ 
						_pos, //trouver une pos sure
						0, //min dist
						350, //max dist
						5, //object dist
						0, //water mode 0=no water
						0.33, //max grad between 0 and 1
						0, 
						[], 
					[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
				};

				if(_spawnPos select 0 == 0 && _spawnPos select 1 == 0 ) then {continue};

				[_spawnPos, _grp, _side, _spawnedUnits, true, _dir, true] spawn GDGM_fnc_spawnTransport;
				_spawnedMountedGrps pushBack _grp;
				sleep 2;

				_wp = _grp addWaypoint [[_posTo select 0, _posTo select 1, 0], 150];
				_wp setWaypointType "SAD";
				_wp setWaypointBehaviour "AWARE";
				_wp setwaypointcombatmode "YELLOW"; 
				_wp setWaypointCompletionRadius 50;

				sleep 5;
			};
		};
		case "tank": {
			for [{private _i = 0}, {_i < _x select 1}, {_i = _i + 1}] do {
				private _grp = createGroup [_side ,true]; 
				if(count _nearbyRoads != 0) then {
					_road = selectRandom _nearbyRoads;
					_spawnPos = getPos _road;
					_nearbyRoads = _nearbyRoads - [_road];
					private _info = getRoadInfo _road;
					_dir = (_info select 6) getDir (_info select 7);
				} else {
					_spawnPos = [ 
						_pos, //trouver une pos sure
						0, //min dist
						350, //max dist
						5, //object dist
						0, //water mode 0=no water
						0.33, //max grad between 0 and 1
						0, 
						[], 
					[[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos;
				};

				if(_spawnPos select 0 == 0 && _spawnPos select 1 == 0 ) then {continue};

				[_spawnPos, _grp, _side, _spawnedUnits, _dir, true] spawn GDGM_fnc_spawnTank;
				sleep 2;
				_wp = _grp addWaypoint [[_posTo select 0, _posTo select 1, 0], 150];
				_wp setWaypointType "SAD";
				_wp setWaypointBehaviour "SAFE";
				_wp setwaypointcombatmode "YELLOW";
				_wp setWaypointCompletionRadius 50; 

				sleep 5;
			};
		};
	};
	sleep 10;
} forEach _bg;

//spawn hq
_newGrp = createGroup [_side ,true]; 
[_pos, _newGrp, _side, _spawnedUnits, objnull, "COLONEL"] spawn GDGM_fnc_spawnHQ;

sleep 2;
_wp = _newGrp addWaypoint [[_posTo select 0, _posTo select 1, 0], 150];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
_wp setwaypointcombatmode "YELLOW"; 
_wp setWaypointCompletionRadius 50;

//add spawned units to toNode
sleep 15;
private _previouslySpawned = (_toNode getVariable "GDGM_spawnedObjects") + _spawnedUnits;
_toNode setVariable ["GDGM_spawnedObjects",_previouslySpawned];
