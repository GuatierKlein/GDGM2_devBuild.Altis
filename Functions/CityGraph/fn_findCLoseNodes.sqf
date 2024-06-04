params["_pos","_maxDist"];

//return all nodes in given radius
_allNodes = [];
_maxDist = _maxDist * _maxDist;

// _allNodes = [_allNodes, [_pos,_maxDist], {
// 	(_x getVariable "GDGM_position") distanceSqr _input0
// }, "ASCEND", {
// 	(_x getVariable "GDGM_position") distanceSqr _input0 < _input1
// }] call BIS_fnc_sortBy;

{
	if((_x getVariable "GDGM_position") distanceSqr _pos < _maxDist) then {
		_allNodes pushBack _x;
	};	
} forEach GDGM_allNodes;

_allNodes;