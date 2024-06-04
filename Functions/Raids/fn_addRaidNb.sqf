params["_side","_amount"];

switch (_side) do {
	case east: { GDGM_eastRaidNb = GDGM_eastRaidNb + _amount };
	case west: { GDGM_westRaidNb = GDGM_westRaidNb + _amount };
	case independent: { GDGM_indRaidNb = GDGM_indRaidNb + _amount };
};