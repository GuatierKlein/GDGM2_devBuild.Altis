params["_side","_node"];
private _pos = [];
private _spawnPool = [];
private _crewPool = [];
private _baseUnit = [];
private _ennemySide = _node getVariable "GDGM_owner";

switch (_ennemySide) do {
	case east: {_pos = getMarkerPos "GDGM_OPFOR_airCorridor"; _spawnPool = GDGM_OPFOR_FighterPlanes; _crewPool = GDGM_OPFOR_CrewDummies; _baseUnit = GDGM_OPFOR_baseUnit};
	case west: {_pos = getMarkerPos "GDGM_BLUFOR_airCorridor"; _spawnPool = GDGM_BLUFOR_FighterPlanes; _crewPool = GDGM_BLUFOR_CrewDummies; _baseUnit = GDGM_BLUFOR_baseUnit};
	case independent: {_pos = getMarkerPos "GDGM_IND_airCorridor"; _spawnPool = GDGM_IND_FighterPlanes; _crewPool = GDGM_IND_CrewDummies; _baseUnit = GDGM_IND_baseUnit};
};

if(count _spawnPool == 0) exitWith {};

_grp = createGroup [_ennemySide ,true]; 
private _plane = selectRandom _spawnPool;
private _crewLoadout = selectRandom _crewPool;
private _veh1 = createVehicle [_plane, _pos, [], 0, "FLY"];
private _crew = _grp createUnit [ _baseUnit, _pos, [], 0, "FORM"];
_crew setUnitLoadout getUnitLoadout _crewLoadout;
_crew moveInDriver _veh1;
_crew setRank "LIEUTENANT";

private _plane = selectRandom _spawnPool;
private _crewLoadout = selectRandom _crewPool;
private _veh2 = createVehicle [_plane, _pos, [], 0, "FLY"];
private _crew = _grp createUnit [ _baseUnit, _pos, [], 0, "FORM"];
_crew setUnitLoadout getUnitLoadout _crewLoadout;
_crew moveInDriver _veh2;
_crew setRank "LIEUTENANT";

private _targetPos = _node getVariable "GDGM_position";

private _wp = _grp addWaypoint [_targetPos, 150];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";

//create task
private _title = "Fighter mission: Fighter squadron";
private _desc = ([daytime, "HH:MM"] call BIS_fnc_timeToString) + ", " + ([_ennemySide] call GDGM_fnc_getFactionName) + " has fighters circling around " + (_node getVariable "GDGM_name") + ", destroy them! (This mission is for pilots)";
private _taskId = str _side + str _node + str dayTime;

[_side, _taskId, [_desc, _title, ""], getPos _veh1, "CREATED", -1, true] call BIS_fnc_taskCreate;

//succeed task
while {alive _veh1 && alive _veh2} do {	
	if(alive _veh1) then {
		_pos = getPosASL _veh1;
	} else {
		_pos = getPosASL _veh2;
	};
	[_taskId, _pos] call BIS_fnc_taskSetDestination;
	sleep 30;
};

[_taskId,"SUCCEEDED"] call BIS_fnc_taskSetState;

[_ennemySide, -50] spawn GDGM_fnc_addPoints;

GDGM_planeRaid_nb = GDGM_planeRaid_nb - 1;
// [_ennemySide, 1] call GDGM_fnc_addThreatLevel;




