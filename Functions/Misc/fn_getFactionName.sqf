params ["_side"];

private _res = "";

switch (_side) do {
	case east: { _res = GDGM_eastName };
	case west: { _res = GDGM_westName };
	case independent: { _res = GDGM_independentName };
};

_res;