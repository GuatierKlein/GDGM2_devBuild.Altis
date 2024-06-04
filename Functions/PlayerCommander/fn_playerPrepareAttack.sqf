params["_pos","_side","_bgIndex","_client"];
//serverside

if(_bgIndex == -1) exitWith {
	"Please choose a battlegroup" remoteExec ["systemChat",_client];
};

//find closest node
private _toNode = [_pos] call GDGM_fnc_findClosestNode;
("Selected " + (_toNode getVariable "GDGM_name")) remoteExec ["systemChat",_client];

//chack onwership 
if(_toNode getVariable "GDGM_owner" == _side) exitWith {
	"You cannot attack a node you own" remoteExec ["systemChat",_client];
};

//chack frontline 
if!([_toNode, _side] call GDGM_fnc_isOnFrontlineSide) exitWith {
	"Invalid node selection, node is not on frontline or is under attack" remoteExec ["systemChat",_client];
};

//check cost 
private _bg = GDGM_battlegroupPool select _bgIndex;
private _cost = _bg select 1;
private _costReserve = _bg select 2;
private _combatPower = _bg select 4;
private _points = [_side] call GDGM_fnc_getPoints;
private _reserves = [_side] call GDGM_fnc_getReserves;

if(_cost > _points) exitWith {
	"Not enough points" remoteExec ["systemChat",_client];
};

if(_costReserve > _reserves) exitWith {
	"Not enough reserves" remoteExec ["systemChat",_client];
};

//find node from
private _fromNode = [_side, _toNode, false] call GDGM_fnc_findFriendlyNeighbourNode;

if(isNull _fromNode) exitWith {
	"You have no node to attack this node from" remoteExec ["systemChat",_client];
};

//create attack 
private _garrisonStrength = _toNode getVariable "GDGM_garrison";
[_side, _fromNode, _toNode, _garrisonStrength, _bg select 0, _cost, _costReserve, _combatPower] spawn GDGM_fnc_prepareAttack;
closeDialog 1;