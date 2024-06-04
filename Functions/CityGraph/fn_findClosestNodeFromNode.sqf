params["_node"];

private _allNodes = GDGM_allNodes - [_node] - GDGM_entryNodes - GDGM_supplyNodes;
private _minDistNode = _allNodes select 0;
private _pos = _node getVariable "GDGM_position";
private _minDist = _pos distanceSqr (_minDistNode getVariable "GDGM_position");

{
	private _dist = _pos distanceSqr (_x getVariable "GDGM_position");
	if(_dist < _minDist) then {
		_minDistNode = _x;
		_minDist = _dist;
	};	
} forEach _allNodes;

_minDistNode;