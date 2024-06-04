params["_node",["_onlyUnconnected",false]];

//return all nodes in given radius ordered by distance 
_allNodes = GDGM_allNodes;
_pos = _node getVariable "GDGM_position";

if(!_onlyUnconnected) then {
	_allNodes = [_allNodes, [_pos,_node], {_x getVariable "GDGM_position" distanceSqr _input0}, "ASCEND", {_x != _input1}] call BIS_fnc_sortBy;
} else {
	_allNodes = [_allNodes, [_pos,_node], {_x getVariable "GDGM_position" distanceSqr _input0}, "ASCEND", {
		_x != _input1 && !([_x, _input1] call GDGM_fnc_isConnectedTo)
	}] call BIS_fnc_sortBy;
};

_allNodes;