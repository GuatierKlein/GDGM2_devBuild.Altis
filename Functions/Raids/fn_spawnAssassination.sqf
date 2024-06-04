params["_node","_taskId"];

private _side = _node getVariable "GDGM_owner";
private _spawnedObjects = [];
private _nbPatrols = ceil (random 3);
private _houses = [_node, 250] call GDGM_fnc_getOpenedHouses;
private _pos = _node getVariable "GDGM_position";
private _isFrontLine = [_node] call GDGM_fnc_isOnFrontline;
private _targetPos = getPosASL (_houses select 0);
private _maxTime = 1800;

//spawn reserves if no frontline
if(!_isFrontLine) then {
	for [{_i = 0}, {_i < _nbPatrols}, {_i = _i + 1}] do {
		private _grp = createGroup [_side ,true]; 
		private _patrolPoints = [_targetPos, 4, (50 + random 100)] call GDGM_fnc_findPatrolPoints;
		[(_patrolPoints select 0), _grp, _side, _spawnedObjects, 7, "NONE", true] spawn GDGM_fnc_spawnSquad;
		
		private _wp = objNull;

		{
			_wp = _grp addWaypoint [_x, 0];
			_wp setWaypointType "Move";
			_wp setWaypointBehaviour "SAFE";
			_wp setwaypointcombatmode "YELLOW"; 
			_wp setWaypointSpeed "LIMITED"; 
		} forEach _patrolPoints;

		_wp setWaypointType "cycle";
	};
};

//spawn target
_house = _houses select 0;
_grp = createGroup [_side ,true]; 
[_pos, _grp, _side, _spawnedObjects, _house] spawn GDGM_fnc_spawnHQ;
sleep 20;
private _target = leader _grp;
private _i = 0;

//create marker 
private _markerPos = (getPosASL _house) getPos [floor(random 100), floor(random 360)];
_marker_object = createMarker ["marker_" + str _markerPos, _markerPos];
_marker_object setMarkerShape "ELLIPSE";
_marker_object setMarkersize [100, 100];
_marker_object setMarkerBrush "FDiagonal";
_marker_object setMarkerColor "colorred";
// _marker_object setMarkerAlpha 0.25;

while {alive _target && _i < _maxTime} do {
	_i = _i + 10;
	sleep 10;
};

if(!alive _target) then {
	[_side, -20] call GDGM_fnc_addPoints;
	[_side, true] call GDGM_fnc_setSkipTurn;
	[_taskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
} else {
	"The officer has run away" remoteExec ["systemChat",0];
	[_taskId,"FAILED"] call BIS_fnc_taskSetState;
	deleteVehicle _target;
};

[_side, -1] call GDGM_fnc_addRaidNb;
deleteMarker _marker_object;

//despawn 
sleep 600;
{
	if(_x getVariable "GDGM_reserve") then {
		_side = _x getVariable "GDGM_owner";
		switch (_x getVariable "GDGM_type") do {
			case "truck": { [_side, [1,0,0,0,0]] call GDGM_fnc_addVehReserves; };
			case "apc": { [_side, [0,1,0,0,0]] call GDGM_fnc_addVehReserves; };
			case "tank": { [_side, [0,0,1,0,0]] call GDGM_fnc_addVehReserves; };
			case "man": { [side _x, 1] call GDGM_fnc_addReserves; };
			default { };
		};
	};
	deleteVehicle _x;
} forEach _spawnedObjects;

