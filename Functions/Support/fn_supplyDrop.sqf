params ["_pos", "_side", "_unit"];

private _corridorPos = [];
private _usingAirport = false;
private _airPortPos = [];
private _price = 20;
private _planePool = [];
private _crewPool = [];
private _baseUnit = "";
private _spawnType = "FLY";
private _amountPerUnit = 15;

switch (_side) do {
	case east: {_corridorPos = getMarkerPos "GDGM_OPFOR_airCorridor"; _casIsFree = GDGM_isCASFree_east; _baseUnit = GDGM_OPFOR_baseUnit; _planePool = GDGM_OPFOR_transportPlanes; _crewPool = GDGM_OPFOR_CrewDummies; };
	case west: {_corridorPos = getMarkerPos "GDGM_BLUFOR_airCorridor"; _casIsFree = GDGM_isCASFree_west; _baseUnit = GDGM_BLUFOR_baseUnit; _planePool = GDGM_BLUFOR_transportPlanes; _crewPool = GDGM_BLUFOR_CrewDummies; };
	case independent: {_corridorPos = getMarkerPos "GDGM_IND_airCorridor"; _casIsFree = GDGM_isCASFree_ind; _baseUnit = GDGM_IND_baseUnit; _planePool = GDGM_IND_transportPlanes; _crewPool = GDGM_IND_CrewDummies; };
};

private _spawnPos = _corridorPos;

if(count _planePool < 1) exitWith {
	systemChat ("GDGM: No transport planes available for " + str _side);
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

//check for friendly airports 
private _closestFriendlyAirport = [_pos, _side] call GDGM_fnc_findClosestSidedAirport;
if (!isNull _closestFriendlyAirport) then {
	_usingAirport = true;
	_airPortPos = _closestFriendlyAirport getVariable "GDGM_position";
};

//spend points
[_side, -_price] call GDGM_fnc_addPoints;

private _grp = createGroup [_side ,true]; 
private _tempArray = [];
systemChat ("GDGM: Spawning supply drop for " +  str _side);

if(_usingAirport) then {
	_spawnType = "NONE";
	_spawnPos = [_airPortPos select 0, _airPortPos select 1, 0];
};

//spawn plane
private _grp = createGroup [_side, true];
private _plane = selectRandom _planePool;
private _crewLoadout = selectRandom _crewPool;
private _veh = createVehicle [_plane, _spawnPos, [], 0, _spawnType];
private _crew = _grp createUnit [ _baseUnit, _spawnPos, [], 0, "FORM"];

_crew setUnitLoadout getUnitLoadout _crewLoadout;
_crew moveInDriver _veh;
_crew setRank "LIEUTENANT";

_crew setBehaviour "CARELESS";
_veh allowFleeing 0;
_veh flyInHeight 100;

_wp = _grp addWaypoint [_pos, 150];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setwaypointcombatmode "BLUE"; 
_wp setWaypointStatements ["true", "
	[vehicle this, _gearMap] spawn GDGM_fnc_dropSuppliesFromPlane;
"];

sleep 10; //wait for plane to spawn

private _time = 0;
private _leader = leader _grp;

//return to corridor
_wp = _grp addWaypoint [_corridorPos, 0];
_wp setWaypointType "MOVE";
_wp setwaypointcombatmode "BLUE"; 
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointStatements ["true", "
	deleteVehicle vehicle this;
	{ deleteVehicle _x } forEach units group this;
"];




