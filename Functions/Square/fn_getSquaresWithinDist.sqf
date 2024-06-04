params["_pos","_dist",["_onlyFrontline",false],["_side",""]];

private _res = [];
//_dist = _dist * _dist;
private _fortifPos = [];
private _sideX = west;

if(_onlyFrontline) then {
	{
		private _y = _x;
		{
			_fortifPos = _x getVariable "GDGM_position";
			_sideX = _x getVariable "GDGM_owner";
			if(_fortifPos select 0 == 0 || _side != _sideX) then {continue};

			if(_pos distance2D _fortifPos < _dist) then {
				_res pushBack _x;
			};				
		} forEach _y;
	} forEach GDGM_allSquares;
} else {
	{
		{
			_fortifPos = _x getVariable "GDGM_position";

			if(_fortifPos select 0 == 0) then {continue};

			if(_pos distance2D _fortifPos < _dist) then {
				_res pushBack _x;
			};				
		} forEach _x;
	} forEach GDGM_allSquares;
};

_res;