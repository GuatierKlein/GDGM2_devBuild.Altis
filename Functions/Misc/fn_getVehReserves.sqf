// [trucks, apcs, tanks, transport helos, combat aircrafts]
params["_side"];

private _res = [];

switch (_side) do {
	case east: { _res = GDGM_OPFOR_vehReserves };
	case west: { _res = GDGM_BLUFOR_vehReserves };
	case independent: { _res = GDGM_IND_vehReserves };
};

_res;

