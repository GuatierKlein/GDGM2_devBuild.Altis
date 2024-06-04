// [trucks, apcs, tanks, transport helos, combat aircrafts]
params["_side"];

private _res = [];

switch (_side) do {
	case "EAST": { _res = GDGM_OPFOR_vehReserves };
	case "WEST": { _res = GDGM_BLUFOR_vehReserves };
	case "GUER": { _res = GDGM_IND_vehReserves };
};

_res;

