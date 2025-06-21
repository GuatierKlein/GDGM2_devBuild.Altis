params ["_pos", "_side"];


private _closestNode = objNull;
private _minDist = 1e10;

{
	private _dist = _pos distanceSqr (_x getVariable "GDGM_position");
	if(_dist < _minDist && _x getVariable "GDGM_owner" == _side) then {
		_minDist = _dist;
		_closestNode = _x;
	};
} forEach GDGM_airportNodes;

_closestNode;



