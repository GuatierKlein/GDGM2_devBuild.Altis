params["_pos","_side"];

private _allNodes = GDGM_allNodes - GDGM_entryNodes - GDGM_supplyNodes;
private _minDistNode = objNull;
private _minDist = worldSize * worldSize;

{
	private _owner = _x getVariable "GDGM_owner";
	private _isContested = _x getVariable "GDGM_isContested";
	if(_owner != _side || _isContested) then {continue};
	private _dist = _pos distanceSqr (_x getVariable "GDGM_position");
	if(_dist < _minDist) then {
		_minDistNode = _x;
		_minDist = _dist;
	};	
} forEach _allNodes;

_minDistNode;

