params ["_node1","_node2"];

GDGM_fnc_isConnectedToRecursive = {
	params ["_currentNode","_previousNodes","_nodeToReach"];
	_connected = false;
	_proceed = true;

	if(_currentNode == _nodeToReach) then {_connected = true; _proceed = false};
	if(_currentNode in _previousNodes) then {_connected = false; _proceed = false};
	_previousNodes pushBackUnique _currentNode;

	if(_proceed) then {
		{
			//TODO opti
			_connected = _connected || [_x,_previousNodes,_nodeToReach] call GDGM_fnc_isConnectedToRecursive;
			if(_connected) then {
				break;
			};		
		} forEach (_currentNode getVariable "GDGM_connectedNodes");
	};
	_connected;
};

_res = [_node1,[],_node2] call GDGM_fnc_isConnectedToRecursive;
_res;