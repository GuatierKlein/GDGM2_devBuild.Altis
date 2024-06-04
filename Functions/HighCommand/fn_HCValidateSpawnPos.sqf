params["_pos", "_side", "_clientId"];

private _closestNode = [_pos] call GDGM_fnc_findClosestNode;
private _commander = [_side] call GDGM_fnc_getCommander;

if(_pos distance2D _closestNode > 500 && _pos distance2D _commander > 250) exitWith {
	"No nodes not commander within 500m of the clicked position" remoteExec ["systemChat", _clientId];
	false;
};

if(_closestNode getVariable "GDGM_owner" != _side) exitWith {
	"You can only spawn unit inside friendly nodes!" remoteExec ["systemChat", _clientId];
	false;
};

if(_closestNode getVariable "GDGM_isEncircled") exitWith {
	"You cannot spawn units in an encircled town!" remoteExec ["systemChat", _clientId];
	false;
};

if(_closestNode getVariable "GDGM_underAttack") exitWith {
	"You cannot spawn units in a town that is under attack!" remoteExec ["systemChat", _clientId];
	false;
};

true;
