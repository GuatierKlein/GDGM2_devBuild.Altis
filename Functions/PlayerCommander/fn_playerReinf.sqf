params["_player"];

private _pos = getPos _player;
private _side = side _player;

//find close nodes 
//if none in 2km radius, send heli 
//serverside
if(([_side] call GDGM_fnc_getPoints) + GDGM_player_supplies < 10) exitWith {"Not enough logistic points" remoteExec ["systemChat",0]};
if(([_side] call GDGM_fnc_getReserves) + GDGM_player_reserves < 7) exitWith {"Not enough reserves" remoteExec ["systemChat",0]};

player sideRadio "radio_reinf_request";

["player", -10] spawn GDGM_fnc_addPoints;

private _eligibleNodes = [];
private _closestNode = [_pos, _side] call GDGM_fnc_findClosestSidedNode;
private _amountPerUnit = 15;
private _fromNode = objNull;
private _fromPos = [];
private _road = objNull;
private _nearbyRoads = [];
private _markerType = "";
private _waitTime = 120;
private _loadoutPool = [];

_fromPos = _closestNode getVariable "GDGM_position";
_nearbyRoads = [_fromPos select 0, _fromPos select 1] nearRoads 250;
_road = selectRandom _nearbyRoads;

//spawn truck
private _veh = objNull;
private _grp = createGroup [_side ,true];
if(count _nearbyRoads != 0) then {
	//truck
	private _spawnPos = getPosASL _road;
	private _info = getRoadInfo _road;
	private _dir = (_info select 6) getDir (_info select 7);
	private _truckPool = [];
	private _unitType = [];
	private _unitLoadouts = [];
	private _array = [];

	switch (_side) do {
		case east: { _truckPool = GDGM_OPFOR_transports; _unitType = GDGM_OPFOR_baseUnit; _unitLoadouts = GDGM_OPFOR_rifleDummies; };
		case west: { _truckPool = GDGM_BLUFOR_transports; _unitType = GDGM_BLUFOR_baseUnit; _unitLoadouts = GDGM_BLUFOR_rifleDummies; };
		case independent: { _truckPool = GDGM_IND_transports; _unitType = GDGM_IND_baseUnit; _unitLoadouts = GDGM_IND_rifleDummies; };
	};

	_veh = (selectRandom _truckPool) createVehicle _spawnPos;
	_veh setDir _dir;

	//spawn group
	for [{private _j = 0}, {_j < 7}, {_j = _j + 1}] do {
		//unit type
		switch (_j) do {
			case 0: {
				//SL
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_SLDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_SLDummies};
					case independent: {_loadoutPool = GDGM_IND_SLDummies};
				};
			};
			case 1: {
				//gre  
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_greDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_greDummies};
					case independent: {_loadoutPool = GDGM_IND_greDummies};
				};
			};
			case 3: {
				//at  
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_ATDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_ATDummies};
					case independent: {_loadoutPool = GDGM_IND_ATDummies};
				};
			};
			case 5: {
				//mg  
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_MGDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_MGDummies};
					case independent: {_loadoutPool = GDGM_IND_MGDummies};
				};
			};
			default {
				//rifle
				switch (_side) do {
					case east: {_loadoutPool = GDGM_OPFOR_rifleDummies};
					case west: {_loadoutPool = GDGM_BLUFOR_rifleDummies};
					case independent: {_loadoutPool = GDGM_IND_rifleDummies};
				};
			};
		};

		_unit = _grp createUnit [_unitType,  _spawnPos, [], 0, "NONE"];
		_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
		_unit moveInAny _veh;
		_array pushBack _unit;

		_unit setVariable ["GDGM_owner", side _unit];
		_unit addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			if(!isServer) exitWith {};

			["player", -1] call GDGM_fnc_addReserves;
		}];	
		sleep 0.5;
	};

	[_array] spawn GDGM_fnc_soldierEH;

	_wp = _grp addWaypoint [_pos, 0];
	_wp setWaypointType "GETOUT";
	_wp setWaypointBehaviour "CARELESS";

	_wp = _grp addWaypoint [_player, 10];	
	_wp waypointAttachObject _player;
	_wp setWaypointType "JOIN";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";

	_markerType = "b_motor_inf";
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
} forEach units _grp;

//ading misc grenades
_gearMap set ["HandGrenade", 15];
_gearMap set ["SmokeShell", 15];

//add inventory
{
	_veh addMagazineCargoGlobal [_x, _y];
} forEach _gearMap;

_veh addItemCargoGlobal ["Toolkit", 1];
_veh addItemCargoGlobal ["Medikit", 10];

"Reinforcements on the way" remoteExec ["systemChat",0];
[west, "Base"] sideRadio "radio_reinf_confirm";

//marker
private _marker_object = createMarker [(str _veh + "_marker"), getPosASL _veh];
_marker_object setMarkerTypeLocal _markerType;	
_marker_object setMarkerText "Reinforcements";

while {count units _grp > 0} do {
	_marker_object setMarkerPos (getPosASL _veh);
	sleep 10;
};

deleteMarker _marker_object;

