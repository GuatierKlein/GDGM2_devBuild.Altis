params["_pos"];

private _allNodes = GDGM_allNodes - GDGM_entryNodes;
private _minDistNode = _allNodes select 0;
private _minDist = worldSize * worldSize;

{
	private _dist = _pos distanceSqr (_x getVariable "GDGM_position");
	if(_dist < _minDist) then {
		_minDistNode = _x;
		_minDist = _dist;
	};	
} forEach _allNodes;

_minDistNode;

