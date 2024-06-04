params["_side"];

private _allNodes = GDGM_civiNodes;
private _res = [];
{
	if(_x getVariable "GDGM_owner" == _side) then {
		_res pushBack _x;
	};	
} forEach _allNodes;

_res;


