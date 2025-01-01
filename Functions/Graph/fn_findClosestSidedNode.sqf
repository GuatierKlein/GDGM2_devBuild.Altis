params["_pos","_side"];

private _allNodes = GDGM_allNodes - GDGM_entryNodes - GDGM_supplyNodes;
private _minDistNode = objNull;
private _minDist = worldSize * worldSize;

{
	private _owner = _x getVariable "GDGM_owner";
	if(_owner != _side) then {continue};
	private _dist = _pos distanceSqr (_x getVariable "GDGM_position");
	if(_dist < _minDist) then {
		_minDistNode = _x;
		_minDist = _dist;
	};	
} forEach _allNodes;

_minDistNode;

