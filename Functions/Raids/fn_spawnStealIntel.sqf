params["_node","_taskId"];

private _side = _node getVariable "GDGM_owner";
private _spawnedObjects = [];
private _nbPatrols = ceil (random 2);
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
private _allPos = _house buildingPos -1;
private _spawnPos = selectRandom _allPos;

private _case = "Land_Suitcase_F" createVehicle _spawnPos;
_case setPosATL _spawnPos;

//create marker 
private _markerPos = (getPosASL _house) getPos [floor(random 100), floor(random 360)];
_marker_object = createMarker ["marker_" + str _markerPos, _markerPos];
_marker_object setMarkerShape "ELLIPSE";
_marker_object setMarkersize [100, 100];
_marker_object setMarkerBrush "FDiagonal";
_marker_object setMarkerColor "colorred";
// _marker_object setMarkerAlpha 0.25;

//action 
[
	_case,														// Object the action is attached to
	"Take documents",													// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",									// Condition for the action to be shown
	"_caller distance _target < 3",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
		deleteVehicle _target;
	},							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	10,																// Action duration in seconds
	0,																// Priority
	true,															// Remove on completion
	false															// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _case];				// MP-compatible implementation

private _i = 0;

while {!isNull _case && _i < _maxTime} do {
	_i = _i + 10;
	sleep 10;
};

if(isNull _case) then {
	[_side, -100] call GDGM_fnc_addPoints;
	//give intel like amount of supply and reserves -> remove it from the player menu
	[_taskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
} else {
	"An officer has run away with the documents" remoteExec ["systemChat",0];
	[_taskId,"FAILED"] call BIS_fnc_taskSetState;
	deleteVehicle _case;
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

