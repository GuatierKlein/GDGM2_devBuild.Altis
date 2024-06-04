params["_pos","_side", ["_amount", 1]];

//2 helos
if(!GDGM_enableHelicopters) exitWith {};
private _price = 10;
private _spawnPos = [];

switch (_side) do {
	case west: {_spawnPos = getMarkerPos "GDGM_BLUFOR_airCorridor" };
	case east: {_spawnPos = getMarkerPos "GDGM_OPFOR_airCorridor" };
	case independent: {_spawnPos = getMarkerPos "GDGM_IND_airCorridor" };
};

//spawn helo
_spawnPos = ASLToATL _spawnPos;

for [{private _i = 0}, {_i < _amount}, {_i = _i + 1}] do {

	private _supplies = [_side] call GDGM_fnc_getPoints;
	if(_supplies - _price < 0) then {break};

	[_side, -_price] call GDGM_fnc_addPoints;
	private _grp = createGroup [_side ,true]; 
	private _grpSquad = createGroup [_side ,true]; 
	private _heloArray = [];

	[_spawnPos, _grp, _side, _heloArray, true, _grpSquad] spawn GDGM_fnc_spawnHeloTransport;

	_wp = _grp addWaypoint [_pos, 1200];
	_wp setWaypointType "TR UNLOAD";
	_wp setWaypointBehaviour "CARELESS";

	_wp = _grpSquad addWaypoint [_pos, 50];
	_wp setWaypointType "SAD";

	//helo RTB 
	_wp = _grp addWaypoint [_spawnPos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointStatements ["true", "if(isServer) then {private _veh = vehicle this; {deleteVehicle _x} forEach (crew _veh); deleteVehicle _veh;};"];

	sleep 10;
};
