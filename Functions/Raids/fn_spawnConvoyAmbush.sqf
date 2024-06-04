params["_toNode","_spawnPoss","_taskId"];

private _side = _toNode getVariable "GDGM_owner";
private _spawnedObjects = [];
private _grp = createGroup [_side ,true]; 
private _posTo = _toNode getVariable "GDGM_position";
private _maxTime = 1800; 
private _i = 0;

[(_spawnPoss select 0) select 0, _grp, _side, _spawnedObjects, false, (_spawnPoss select 0) select 1, true] call GDGM_fnc_spawnAPC;
[(_spawnPoss select 1) select 0, _grp, _side, _spawnedObjects, true, (_spawnPoss select 1) select 1, true] call GDGM_fnc_spawnTransport;
[(_spawnPoss select 2) select 0, _grp, _side, _spawnedObjects, true, (_spawnPoss select 2) select 1, true] call GDGM_fnc_spawnTransport;
[(_spawnPoss select 3) select 0, _grp, _side, _spawnedObjects, true, (_spawnPoss select 2) select 1, true] call GDGM_fnc_spawnLightArmedVeh;

private _wp = _grp addWaypoint [[_posTo select 0, _posTo select 1, 0], 150];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setwaypointcombatmode "YELLOW";
_wp setWaypointFormation "COLUMN";
_wp setWaypointSpeed "LIMITED";

//moving marker 
private _leader = leader _grp;
private _marker_object = createMarker [(str _leader + "_marker"), getPosASL _leader];
_marker_object setMarkerTypeLocal "o_motor_inf";	
_marker_object setMarkerTextLocal "Convoy";
_marker_object setMarkerColor "colorred";

while {alive _leader && _i < _maxTime} do {
	_marker_object setMarkerPos (getPosASL _leader);
	_i = _i + 10;
	sleep 10;
};

sleep 30;

if(!alive _leader) then {
	[_side, -100] spawn GDGM_fnc_addPoints;
	[_taskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
} else {
	[_taskId,"FAILED"] call BIS_fnc_taskSetState;
};

deleteMarker _marker_object;

[_side, -1] call GDGM_fnc_addRaidNb;

//despawn 
sleep 300;
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

