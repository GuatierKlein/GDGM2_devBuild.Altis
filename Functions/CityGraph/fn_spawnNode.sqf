params["_node"];

if(_node getVariable "GDGM_isSpawned") exitwith {};

private _pos = _node getVariable "GDGM_position";
private _houses = [_pos, GDGM_nodeScanSpawnRadius, true] call GDGM_fnc_getOpenedHouses;

if(count _houses == 0) exitwith {};

GDGM_nbNodeSpawn = GDGM_nbNodeSpawn + 1;

private _garri = _node getVariable "GDGM_garrison";
private _numberOfOccHouses = 2;
private _house = objNull;
private _allPos = [];
private _spawnPos = [];
private _owner = _node getVariable "GDGM_owner";
private _unitCount = 0;
private _unitCountGeneral = 0;
private _loadoutPool = [];
private _unit = objNull;
private _tmpArray = [];
private _unitType = "";

//spawn pool  
switch (_owner) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit };
	case west: {_unitType = GDGM_BLUFOR_baseUnit };
	case independent: {_unitType = GDGM_IND_baseUnit };
};

_numberOfOccHouses = floor((_garri / 2) / 5); 

if(_numberOfOccHouses > 10) then {
	_numberOfOccHouses = 10;
};

//destruction 
[_node, _pos, (_node getVariable "GDGM_destructionAmount")] spawn GDGM_fnc_spawnDestructionEffects;

//spawn hq
_house = _houses select 0;
_houses = _houses - [_house];
_newGrp = createGroup [_owner ,true]; 
[_pos, _newGrp, _owner, _tmpArray, _house] spawn GDGM_fnc_spawnHQ;

//unit spawning in houses = 2/3 of the garri
for [{private _i = 0}, {_i < _numberOfOccHouses}, {_i = _i + 1}] do {
	if(count _houses == 0) then {break};

	_house = _houses select 0;
	_houses = _houses - [_house];

	_allPos = _house buildingPos -1;
	_newGrp = createGroup [_owner ,true]; 
	_unitCount = 0;
	//spawn house
	for [{private _j = 0}, {_j < 5}, {_j = _j + 1}] do {
		if(count _allPos == 0) then {break};

		_spawnPos = selectRandom _allPos;
		_allPos = _allPos - [_spawnPos];

		//unit type
		switch (_unitCount) do {
			case 0: {
				//SL
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_SLDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_SLDummies};
					case independent: {_loadoutPool = GDGM_IND_SLDummies};
				};
			};
			case 1: {
				//gre  
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_greDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_greDummies};
					case independent: {_loadoutPool = GDGM_IND_greDummies};
				};
			};
			case 3: {
				//at  
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_ATDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_ATDummies};
					case independent: {_loadoutPool = GDGM_IND_ATDummies};
				};
			};
			case 5: {
				//mg  
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_MGDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_MGDummies};
					case independent: {_loadoutPool = GDGM_IND_MGDummies};
				};
			};
			default {
				//rifle
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_rifleDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_rifleDummies};
					case independent: {_loadoutPool = GDGM_IND_rifleDummies};
				};
			};
		};

		_unit = _newGrp createUnit [_unitType,  _spawnPos, [], 0, "CAN_COLLIDE"];
		_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
		// _unit disableAI "PATH";
		doStop _unit;
		//_unit setPosATL _spawnPos;
		//TODO code to run on unit spawn
		_tmpArray pushBack _unit;
		_unitCount = _unitCount + 1;
		_unitCountGeneral = _unitCountGeneral + 1;
	};
	[_newGrp, false, true] spawn GDGM_fnc_groupEH;
};

//patrols = 1/3 of the garri, 5 men patrols
private _rest = _garri - _unitCountGeneral;
private _numberOfPatrols = floor(_rest / 5);

if (_owner == GDGM_reducedSide) then {
	_numberOfPatrols = 0;
};

for [{private _i = 0}, {_i < _numberOfPatrols}, {_i = _i + 1}] do {
	if(count _houses == 0) then {break};
	_house = _houses select 0;
	_houses = _houses - [_house];
	_allPos = _house buildingPos -1;
	_newGrp = createGroup [_owner ,true]; 
	_unitCount = 0;

	for [{private _j = 0}, {_j < 5}, {_j = _j + 1}] do {
		if(count _allPos == 0) then {break};

		_spawnPos = selectRandom _allPos;
		_allPos = _allPos - [_spawnPos];

		//unit type
		switch (_unitCount) do {
			case 0: {
				//SL
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_SLDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_SLDummies};
					case independent: {_loadoutPool = GDGM_IND_SLDummies};
				};
			};
			case 1: {
				//gre  
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_greDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_greDummies};
					case independent: {_loadoutPool = GDGM_IND_greDummies};
				};
			};
			case 3: {
				//at  
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_ATDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_ATDummies};
					case independent: {_loadoutPool = GDGM_IND_ATDummies};
				};
			};
			case 5: {
				//mg  
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_MGDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_MGDummies};
					case independent: {_loadoutPool = GDGM_IND_MGDummies};
				};
			};
			default {
				//rifle
				switch (_owner) do {
					case east: {_loadoutPool = GDGM_OPFOR_rifleDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_rifleDummies};
					case independent: {_loadoutPool = GDGM_IND_rifleDummies};
				};
			};
		};

		_unit = _newGrp createUnit [_unitType,  _spawnPos, [], 0, "CAN_COLLIDE"];
		_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
		//TODO code to run on unit spawn
		_tmpArray pushBack _unit;
		_unitCount = _unitCount + 1;
		_unitCountGeneral = _unitCountGeneral + 1;
		private _reinfGroups = _node getVariable "GDGM_reinfGroups";
		_reinfGroups pushBack _newGrp;
	};
	//patrol points 
	private _patrolPoints = [_pos, 4, (100 + random 200)] call GDGM_fnc_findPatrolPoints;
	private _wp = objNull;

	{
		_wp = _newGrp addWaypoint [_x, 0];
		_wp setWaypointType "Move";
		_wp setWaypointBehaviour "SAFE";
		_wp setwaypointcombatmode "YELLOW"; 
		_wp setWaypointSpeed "LIMITED"; 
	} forEach _patrolPoints;

	_wp setWaypointType "cycle";
	[_newGrp, false, true] spawn GDGM_fnc_groupEH;
};

[_tmpArray, _node] spawn GDGM_fnc_garriEH;

//vehicles
if(!(_owner == GDGM_reducedSide && GDGM_reducedSideLimitedSpawn)) then {
	private _nearbyRoads = [_pos select 0, _pos select 1] nearRoads 250;
	if(count _nearbyRoads != 0) then {
		private _road = selectRandom _nearbyRoads;
		private _info = getRoadInfo _road;
		private _dir = (_info select 6) getDir (_info select 7);
		private _pos = getPosASL _road;
		_newGrp = createGroup [_owner ,true]; 
		[_pos, _newGrp, _owner, _tmpArray, true, _dir, true] spawn GDGM_fnc_spawnTransport;
		_wp = _newGrp addWaypoint [_pos, 0];
		_wp setWaypointType "GUARD";
	};
};

if(_garri >= GDGM_smallTownGarri && !(_owner == GDGM_reducedSide && GDGM_reducedSideLimitedSpawn)) then {
	private _nearbyRoads = [_pos select 0, _pos select 1] nearRoads 250;
	if(count _nearbyRoads != 0) then {
		private _road = selectRandom _nearbyRoads;
		private _info = getRoadInfo _road;
		private _dir = (_info select 6) getDir (_info select 7);
		private _pos = getPosASL _road;
		_newGrp = createGroup [_owner ,true]; 
		[_pos, _newGrp, _owner, _tmpArray, false, _dir, true] spawn GDGM_fnc_spawnAPC;
		_wp = _newGrp addWaypoint [_pos, 0];
		_wp setWaypointType "GUARD";
		// _nearbyRoads = _nearbyRoads - [_road];

		// private _road = selectRandom _nearbyRoads;
		// private _info = getRoadInfo _road;
		// private _dir = (_info select 6) getDir (_info select 7);
		// private _pos = getPosASL _road;
		// _newGrp = createGroup [_owner ,true]; 
		// [_pos, _newGrp, _owner, _tmpArray, true, _dir, true] spawn GDGM_fnc_spawnTransport;
		// _wp = _newGrp addWaypoint [_pos, 0];
		// _wp setWaypointType "GUARD";
	};
};

if(_garri >= GDGM_bigTownGarri && !(_owner == GDGM_reducedSide && GDGM_reducedSideLimitedSpawn)) then {
	private _nearbyRoads = [_pos select 0, _pos select 1] nearRoads 350;
	if(count _nearbyRoads != 0) then {
		private _road = selectRandom _nearbyRoads;
		private _info = getRoadInfo _road;
		private _dir = (_info select 6) getDir (_info select 7);
		private _pos = getPosASL _road;
		_newGrp = createGroup [_owner ,true]; 
		[_pos, _newGrp, _owner, _tmpArray, _dir, true] spawn GDGM_fnc_spawnTank;
		_wp = _newGrp addWaypoint [_pos, 0];
		_wp setWaypointType "GUARD";
		_nearbyRoads = _nearbyRoads - [_road];

		private _road = selectRandom _nearbyRoads;
		private _info = getRoadInfo _road;
		private _dir = (_info select 6) getDir (_info select 7);
		private _pos = getPosASL _road;
		_newGrp = createGroup [_owner ,true]; 
		[_pos, _newGrp, _owner, _tmpArray, true, _dir, true] spawn GDGM_fnc_spawnTransport;
		_wp = _newGrp addWaypoint [_pos, 0];
		_wp setWaypointType "GUARD";
	};
};

//spawn roadblocks
if (_owner != GDGM_reducedSide) then {
	[_node] spawn GDGM_fnc_spawnRoadBlocks;
};

//end
sleep 10;

_tmpArray = _tmpArray + (_node getVariable "GDGM_spawnedObjects");
_node setVariable ["GDGM_spawnedObjects",_tmpArray];
_node setVariable ["GDGM_isSpawned",true];

[_node] spawn GDGM_fnc_contestNode;

private _name = _node getVariable "GDGM_name";
private _markerName = _name + "_spawnmarker";

_marker_object = createMarker [_markerName, _pos];
_marker_object setMarkerShape "ELLIPSE";
_marker_object setMarkersize [100, 100];
_marker_object setMarkerBrush "Solid";
_marker_object setMarkerColor "colororange";
_marker_object setMarkerAlpha 0.25;

_node setVariable ["GDGM_spawnMarker",_markerName];