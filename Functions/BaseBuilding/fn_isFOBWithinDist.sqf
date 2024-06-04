params["_pos", "_dist"];

private _res = false;

{
	private _posFOB = getPosASL _x;
	if(_posFOB distance2D _pos < _dist) then {
		_res = true;
		break;
	};
} forEach GDGM_playerFOBs;

_res;