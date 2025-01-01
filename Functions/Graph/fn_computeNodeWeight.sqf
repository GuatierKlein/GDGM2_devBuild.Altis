params["_node"];

private _connectedNodes = _node getVariable "GDGM_connectedNodes";
private _aggregateWeight = (_node getVariable "GDGM_weight") * 2;
private _count = 2;

{
	private _nodeWeight = (_x getVariable "GDGM_weight");
	if(_nodeWeight != -1) then {
		_aggregateWeight = _aggregateWeight + _nodeWeight;
		_count = _count + 1;
	};		
} forEach _connectedNodes;

_aggregateWeight = _aggregateWeight / _count;
_node setVariable ["GDGM_aggWeight",_aggregateWeight];