params["_pos","_side","_unit"];

//find close nodes 
//if none in 2km radius, send heli 
//serverside
if([_side] call GDGM_fnc_getPoints < 10) exitWith {"Not enough points" remoteExec ["systemChat",0]};
[_side, -10] spawn GDGM_fnc_addPoints;

private _eligibleNodes = [];
private _closeNodes = [_pos, 2500] call GDGM_fnc_findCLoseNodes;
private _amountPerUnit = 15;
private _fromNode = objNull;
private _fromPos = [];
private _road = objNull;
private _nearbyRoads = [];
private _markerType = "";
private _waitTime = 300;

{
	if(_side == (_x getVariable "GDGM_owner") && !(_x getVariable "GDGM_underAttack")) then {
		_eligibleNodes pushBack _x;
	};	
} forEach _closeNodes;

if(count _eligibleNodes != 0) then {
	_fromNode = selectRandom _eligibleNodes;
	_fromPos = _fromNode getVariable "GDGM_position";
	_nearbyRoads = [_fromPos select 0, _fromPos select 1] nearRoads 250;
	_road = selectRandom _nearbyRoads;
};

//get group's Gear
private _gearMap = createHashMap;
{
	private _z = _x;
	//primary
	private _mags = primaryWeaponMagazine _z;
	{
		if(_x in _gearMap) then {
			private _amount = (_gearMap get _x) + _amountPerUnit;
			_gearMap set [_x, _amount];
		} else {
			_gearMap set [_x, _amountPerUnit];
		};		
	} forEach _mags;

	//secondary
	_mags = secondaryWeaponMagazine _z;
	{
		if(_x in _gearMap) then {
			private _amount = (_gearMap get _x) + _amountPerUnit;
			_gearMap set [_x, _amount];
		} else {
			_gearMap set [_x, _amountPerUnit];
		};		
	} forEach _mags;

	//handgun
	_mags = handgunMagazine _z;
	{
		if(_x in _gearMap) then {
			private _amount = (_gearMap get _x) + _amountPerUnit;
			_gearMap set [_x, _amount];
		} else {
			_gearMap set [_x, _amountPerUnit];
		};		
	} forEach _mags;	
} forEach units group _unit;

//ading misc grenades
_gearMap set ["HandGrenade", 15];
_gearMap set ["SmokeShell", 15];

//spawn truck
private _veh = objNull;
if(count _nearbyRoads != 0 && _pos distance (_fromNode getVariable "GDGM_position") < GDGM_supplyTruckMaxReach) then {
	//truck
	private _spawnPos = getPosASL _road;
	private _info = getRoadInfo _road;
	private _dir = (_info select 6) getDir (_info select 7);
	private _truckPool = [];
	private _unitType = [];
	private _unitLoadouts = [];
	private _array = [];

	switch (_side) do {
		case east: { _truckPool = GDGM_OPFOR_ammoTrucks; _unitType = GDGM_OPFOR_baseUnit; _unitLoadouts = GDGM_OPFOR_rifleDummies; };
		case west: { _truckPool = GDGM_BLUFOR_ammoTrucks; _unitType = GDGM_BLUFOR_baseUnit; _unitLoadouts = GDGM_BLUFOR_rifleDummies; };
		case independent: { _truckPool = GDGM_IND_ammoTrucks; _unitType = GDGM_IND_baseUnit; _unitLoadouts = GDGM_IND_rifleDummies; };
	};

	private _grp = createGroup [_side ,true];
	_veh = (selectRandom _truckPool) createVehicle _spawnPos;
	_veh setDir _dir;

	//spawn crew 
	_unit = _grp createUnit [_unitType,  _spawnPos, [], 0, "FORM"];
	_unit setUnitLoadout getUnitLoadout (selectRandom _unitLoadouts);
	_unit moveInDriver _veh;
	_unit assignAsDriver _veh;
	_array pushBack _unit;

	[_array] spawn GDGM_fnc_soldierEH;
	[_veh, 10] spawn GDGM_fnc_vehEH;

	_wp = _grp addWaypoint [_pos, 10];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointTimeout [_waitTime, _waitTime, _waitTime];

	_wp = _grp addWaypoint [_spawnPos, 10];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointStatements ["true", "if(isServer) then {{deleteVehicle _x} forEach (crew vehicle this); deleteVehicle vehicle this;};"];

	_markerType = "b_motor_inf";
} else {
	//helo
	if(!GDGM_enableHelicopters) exitWith {"No nearby roads" remoteExec ["_systemChat",0]};
	
	private _spawnPos = [];
	private _truckPool = [];
	private _unitType = [];
	private _unitLoadouts = [];
	private _array = [];

	switch (_side) do {
		case east: {_truckPool = GDGM_OPFOR_transportHelos; _spawnPos = getMarkerPos "GDGM_OPFOR_airCorridor"; _unitType = GDGM_OPFOR_baseUnit; _unitLoadouts = GDGM_OPFOR_CrewDummies; };
		case west: {_truckPool = GDGM_BLUFOR_transportHelos; _spawnPos = getMarkerPos "GDGM_BLUFOR_airCorridor"; _unitType = GDGM_BLUFOR_baseUnit; _unitLoadouts = GDGM_BLUFOR_CrewDummies; };
		case independent: {_truckPool = GDGM_IND_transportHelos; _spawnPos = getMarkerPos "GDGM_IND_airCorridor"; _unitType = GDGM_IND_baseUnit; _unitLoadouts = GDGM_IND_CrewDummies; };
	};

	if(count _truckPool == 0) exitWith {
		"Error: Your faction has no helicopter" remoteExec ["systemChat",0];
	};

	private _grp = createGroup [_side ,true];
	_veh = createVehicle [(selectRandom _truckPool), _spawnPos, [], 0, "FLY"];

	//spawn crew 
	_unit = _grp createUnit [_unitType,  _spawnPos, [], 0, "FORM"];
	_unit setUnitLoadout getUnitLoadout (selectRandom _unitLoadouts);
	_unit moveInDriver _veh;
	_unit assignAsDriver _veh;
	_array pushBack _unit;

	[_array] spawn GDGM_fnc_soldierEH;
	[_veh, 50] spawn GDGM_fnc_vehEH;

	_wp = _grp addWaypoint [_pos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointStatements ["true", "if(isServer) then {(vehicle this) land 'LAND'}"];

	_wp = _grp addWaypoint [_pos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointTimeout [_waitTime, _waitTime, _waitTime];

	_wp = _grp addWaypoint [_spawnPos, 10];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointStatements ["true", "if(isServer) then {private _veh = vehicle this; {deleteVehicle _x} forEach (crew _veh); deleteVehicle _veh;};"];

	_markerType = "b_air";
};

//add inventory
{
	_veh addMagazineCargoGlobal [_x, _y];
} forEach _gearMap;

_veh addItemCargoGlobal ["Toolkit", 1];
_veh addItemCargoGlobal ["Medikit", 10];

//kit select 
[[_veh], "scripts\kit_select\kitSelectAction.sqf"] remoteExec["execVM",0];
// [[_veh], "scripts\kit_select\customKitAction.sqf"] remoteExec["execVM",0];

"Ammo support on the way" remoteExec ["systemChat",0];

//marker
private _marker_object = createMarker [(str _veh + "_marker"), getPosASL _veh];
_marker_object setMarkerTypeLocal _markerType;	
_marker_object setMarkerText "Ammo resupply";

while {alive _veh && !isNull _veh} do {
	_marker_object setMarkerPos (getPosASL _veh);
	sleep 10;
};

deleteMarker _marker_object;

