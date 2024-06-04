params["_pos","_side"];

// if(!GDGM_enableHelicopters) exitWith {};
private _price = 20;
private _supplies = [_side] call GDGM_fnc_getPoints;

//check if enough

if(_supplies - _price < 0) exitwith {};

private _spawnPos = [];
private _spawnPool = [];

switch (_side) do {
	case west: {_spawnPos = getMarkerPos "GDGM_BLUFOR_airCorridor" };
	case east: {_spawnPos = getMarkerPos "GDGM_OPFOR_airCorridor" };
	case independent: {_spawnPos = getMarkerPos "GDGM_IND_airCorridor" };
};

switch (_side) do {
	case west: {_spawnPool = GDGM_OPFOR_armedHelos };
	case east: {_spawnPool = GDGM_BLUFOR_armedHelos };
	case independent: {_spawnPool = GDGM_IND_armedHelos };
};

if(count _spawnPool == 0) exitwith {};


//spend points
[_side, -_price] call GDGM_fnc_addPoints;

//spawn helo
_spawnPos = ASLToATL _spawnPos;
private _grp = createGroup [_side ,true]; 
private _heloArray = [];

[_spawnPos, _grp, _side, _heloArray] spawn GDGM_fnc_spawnHelo;

_wp = _grp addWaypoint [_pos, 150];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
_wp setwaypointcombatmode "RED"; 
_wp setWaypointTimeout[200,200,200];

//helo RTB 
_wp = _grp addWaypoint [_spawnPos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointStatements ["true", "if(isServer) then {private _veh = vehicle this; {deleteVehicle _x} forEach (crew _veh); deleteVehicle _veh;};"];
