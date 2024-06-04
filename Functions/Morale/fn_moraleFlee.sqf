params["_grp"];

//find closest not contested node
private _nodeTo = [getPos(leader _grp), side _grp] call GDGM_fnc_findClosestSidedUnconstestedNode;

if(isNull _nodeTo) exitWith {[_grp] spawn GDGM_fnc_surrenderUnits}; 
if(_nodeTo distance (leader _grp) > 3000) exitWith {[_grp] spawn GDGM_fnc_surrenderUnits};

_grp setVariable ["GDGM_isFleeing", true];
private _nodeToPos = _nodeTo getVariable "GDGM_position";
_grp setBehaviourStrong  "AWARE";

//delete waypoints 
for "_i" from 0 to (count waypoints _grp - 1) do
{
	deleteWaypoint [_grp, 0];
};

//flee
private _isLeaderSet = alive leader _grp;
{
	if(!alive _x) then {continue};
	if(vehicle _x != _x) then {
		doGetOut _x;
	};

	if(!_isLeaderSet) then {
		[_grp, _x] remoteExec ["selectLeader", groupOwner _grp];
		_isLeaderSet = true;
	};

	_x enableAI "PATH";
	_x setUnitPos "AUTO";
	
} forEach units _grp;



// sleep 10;

//new waypoint
private _wp = _grp addWaypoint [[_nodeToPos select 0, _nodeToPos select 1, 0], 0];
_wp setWaypointSpeed "FULL";


//delete
// {
// 	if(_x getVariable "GDGM_reserve") then {
// 		_side = _x getVariable "GDGM_owner";
// 		switch (_x getVariable "GDGM_type") do {
// 			case "man": { [side _x, 1] call GDGM_fnc_addReserves; };
// 			case "truck": { [_side, [1,0,0,0,0]] call GDGM_fnc_addVehReserves; };
// 			case "apc": { [_side, [0,1,0,0,0]] call GDGM_fnc_addVehReserves; };
// 			case "tank": { [_side, [0,0,1,0,0]] call GDGM_fnc_addVehReserves; };			
// 			default { };
// 		};
// 	};
// 	deleteVehicle _x;	
// 	sleep 0.1;
// } forEach units _grp;

//bleed effect
private _leader = leader _grp;
{
	private _leaderOther = leader _x;
	private _isFleeing = _x getVariable ["GDGM_isFleeing", true];	
	if(_isFleeing) then {continue};
	if(_leaderOther distance2D _leader < 100 && _leaderOther != _leader) then {		
		[_x, -20] call GDGM_fnc_addMorale;
		[_x] call GDGM_fnc_moraleCheck;
	};
} forEach groups (side _grp);

