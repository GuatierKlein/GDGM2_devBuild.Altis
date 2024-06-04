params["_side"];

private _res = 0;

switch (_side) do {
	case east: { _res = GDGM_planeRaid_OPFOR_threatLevel };
	case west: { _res = GDGM_planeRaid_BLUFOR_threatLevel };
	case independent: { _res = GDGM_planeRaid_IND_threatLevel };
	default { };
};

_res;