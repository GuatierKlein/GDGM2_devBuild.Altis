params["_pos","_dist"];

_array = [];
_dist = _dist * _dist;

{
	if(_pos distanceSqr _x < _dist) then {
		_array pushBack _x;
	};
} forEach GDGM_allNodes;

_array;
