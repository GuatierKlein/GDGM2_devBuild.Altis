params["_side"];

private _res = 0;

switch (_side) do {
	case east: { _res = GDGM_planeRaid_OPFOR_spawnedPlanes };
	case west: { _res = GDGM_planeRaid_BLUFOR_spawnedPlanes };
	case independent: { _res = GDGM_planeRaid_IND_spawnedPlanes };
	default { };
};

_res;