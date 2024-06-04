params["_pos","_cost"];

_closest_crate = GDGM_logiCrateArray select 0;
{
	if (_pos distance _closest_crate > _pos distance _x) then {
		_closest_crate = _x;
	};
} foreach GDGM_logiCrateArray;

_points = _closest_crate getVariable "gdgm_logi_points";
_closest_crate setVariable ["gdgm_logi_points",_points + _cost,true];




