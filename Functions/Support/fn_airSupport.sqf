params ["_pos", "_side", "_type", ["_duration", 300], ["_playerLed", false]];

private _reserves = 0;
private _reservesHelo = 0;
private _corridorPos = [];
private _casIsFree = false;

switch (_side) do {
	case east: { _reserves = GDGM_OPFOR_vehReserves select 4; _reservesHelo = GDGM_OPFOR_vehReserves select 3; _corridorPos = getMarkerPos "GDGM_OPFOR_airCorridor"; _casIsFree = GDGM_isCASFree_east; };
	case west: { _reserves = GDGM_BLUFOR_vehReserves select 4; _reservesHelo = GDGM_BLUFOR_vehReserves select 3; _corridorPos = getMarkerPos "GDGM_BLUFOR_airCorridor"; _casIsFree = GDGM_isCASFree_west; };
	case independent: {  _reserves = GDGM_IND_vehReserves select 4; _reservesHelo = GDGM_IND_vehReserves select 3; _corridorPos = getMarkerPos "GDGM_IND_airCorridor"; _casIsFree = GDGM_isCASFree_ind; };
};

if (!_casIsFree) exitWith {
	systemChat ("GDGM: Air support is not available for " + str _side);
};

switch (_side) do {
	case east: {GDGM_isCASFree_east = false};
	case west: {GDGM_isCASFree_west = false};
	case independent: {GDGM_isCASFree_ind = false};
};

//spend points
// [_side, -_price] call GDGM_fnc_addPoints;

//spawn helo
private _grp = createGroup [_side ,true]; 
private _tempArray = [];
systemChat ("GDGM: Spawning air support for " +  str _side);

switch (_type) do {
	case "cas": {
		//spawn CAS plane
		[_grp, _side, _tempArray, false] spawn GDGM_fnc_spawnCasPlane;
		[_side, [0,0,0,0,-1]] call GDGM_fnc_addVehReserves; //reserve points
	} ;
	case "fighter": {
		//spawn fighter plane
		[_grp, _side, _tempArray, false] spawn GDGM_fnc_spawnFighterPlane;
		[_side, [0,0,0,0,-1]] call GDGM_fnc_addVehReserves; //reserve points
	};
	case "helo": {
		//spawn helo
		[_corridorPos, _grp, _side, _tempArray] spawn GDGM_fnc_spawnHelo;
		[_side, [0,0,0,-1,0]] call GDGM_fnc_addVehReserves; //reserve points
		_reserves = _reservesHelo;
	};
};

if (_reserves < 1) exitWith {
	systemChat ("GDGM: Not enough air support reserves for " + str _side);
};

_wp = _grp addWaypoint [_pos, 150];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
_wp setwaypointcombatmode "RED"; 

sleep 10; //wait for plane to spawn

private _time = 0;
private _leader = leader _grp;

//waitunit plane distance is less than 1500m from position
waitUntil  {
	sleep 5;
	_time = _time + 5;
	//check distance
	((getPosASL _leader) distance2D _pos) < 1500 || !alive _leader || _time > 300
};

systemChat ("GDGM: Air support for " + str _side + " arrived at position.");

if(_playerLed) then {
	[_leader,"Air support is on position, over."] remoteExec ["globalChat",0];
};

_time = 0;

while {_time <= _duration && alive _leader} do {
	sleep 10;
	_time = _time + 10;
};

//delete waypoints
for "_i" from (count waypoints _grp - 1) to 0 step -1 do
{
	deleteWaypoint [_grp, _i];
};

systemChat ("GDGM: Air support for " + str _side + " completed.");

if(alive _leader && vehicle _leader != _leader) then {
	[_side, [0,0,0,0,1]] call GDGM_fnc_addVehReserves;
	if(_playerLed) then {
		[_leader,"Air support completed, returning to base. Over."] remoteExec ["globalChat",0];
	};
};

//helo RTB 
_wp = _grp addWaypoint [_corridorPos, 0];
_wp setWaypointType "MOVE";
_wp setwaypointcombatmode "BLUE"; 
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointStatements ["true", "
	deleteVehicle vehicle this;
	{ deleteVehicle _x } forEach units group this;
"];

_leader setBehaviour "CARELESS";
_leader setCombatMode "BLUE";

sleep 600;

switch (_side) do {
	case east: {GDGM_isCASFree_east = true};
	case west: {GDGM_isCASFree_west = true};
	case independent: {GDGM_isCASFree_ind = true};
};