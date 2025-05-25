_res = [];

{
	if(_y get "allowAttack") then {
		_res pushBack _x;
	};
} forEach GDGM_allDivisions;

_res;