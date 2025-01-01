params["_node","_nodeToAdd"];

_array = _node getVariable "GDGM_connectedNodes";
_node setVariable ["GDGM_connectedNodes", _array + [_nodeToAdd]];

_array = _nodeToAdd getVariable "GDGM_connectedNodes";
_nodeToAdd setVariable ["GDGM_connectedNodes", _array + [_node]];