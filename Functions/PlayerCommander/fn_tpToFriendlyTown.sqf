//serverside
params["_pos","_unit","_clientId"];

private _side = side _unit;
private _posUnit = getPosASL _unit;
private _closestNode = [_pos] call GDGM_fnc_findClosestNode;
private _closestNodeToPlayer = [_posUnit] call GDGM_fnc_findClosestNode;
private _commander = [side _unit] call GDGM_fnc_getCommander;
private _distToNodeDepart = _posUnit distance2D _closestNodeToPlayer;
private _distToNodeArrivee = _pos distance2D _closestNode;

//dist to closest FOB 
private _minDistDepart = 100000;
private _minDistArrivee = 100000;
{
	private _dist = _posUnit distance2D _x;
	if(_dist < _minDistDepart) then {
		_minDistDepart = _dist;
	};

	private _dist = _pos distance2D _x;
	if(_dist < _minDistArrivee) then {
		_minDistArrivee = _dist;
	};
} forEach GDGM_playerFOBs;

_distToNodeDepart = _distToNodeDepart min _minDistDepart;
_distToNodeArrivee = _distToNodeArrivee min _minDistArrivee;

if((_closestNodeToPlayer getVariable 'GDGM_owner' != side _unit || _distToNodeDepart > 250) && _unit distance2D _commander > 250) exitWith {
	"No nodes nor commander within 250m of your position" remoteExec ["systemChat", _clientId];
};

if(_distToNodeArrivee > 250 && _pos distance2D _commander > 250) exitWith {
	"No nodes nor commander within 250m of the clicked position" remoteExec ["systemChat", _clientId];
};

if(_closestNode getVariable "GDGM_owner" != _side) exitWith {
	"You can only teleport to friendly nodes!" remoteExec ["systemChat", _clientId];
};

if(_closestNode getVariable "GDGM_isEncircled") exitWith {
	"You cannot teleport to an encircled town!" remoteExec ["systemChat", _clientId];
};

if(_closestNode getVariable "GDGM_isContested") exitWith {
	"You cannot teleport to a town that is contested!" remoteExec ["systemChat", _clientId];
};

//on client
//make function to tp with camera
[_pos, _closestNode getVariable "GDGM_name"] remoteExec ["GDGM_fnc_teleportPlayer", _clientId];
// _unit setPos _pos;

