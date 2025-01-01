params["_node","_nodesToAdd"];

{
	if(_node == _x) then {
		_nodesToAdd = _nodesToAdd - [_x];
	};
} forEach _nodesToAdd;

_array = _node getVariable "GDGM_connectedNodes";

{
	_array pushBackUnique _x;
	private _destConnections = _x getVariable "GDGM_connectedNodes";
	_destConnections pushBackUnique _node;
	_x setVariable ["GDGM_connectedNodes", _destConnections];
} forEach _nodesToAdd;

_node setVariable ["GDGM_connectedNodes", _array];