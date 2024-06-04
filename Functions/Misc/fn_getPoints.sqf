params["_side"];

private _supplies = 0;

switch (_side) do {
	case west: {_supplies = GDGM_BLUFOR_supplies };
	case east: {_supplies = GDGM_OPFOR_supplies };
	case independent: {_supplies = GDGM_IND_supplies };
};

_supplies;