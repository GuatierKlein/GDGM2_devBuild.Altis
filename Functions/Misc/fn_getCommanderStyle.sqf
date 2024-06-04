params["_side"];

private _style = "";

switch (_side) do {
	case west: {_style = GDGM_BLUFOR_commanderStyle };
	case east: {_style = GDGM_OPFOR_commanderStyle };
	case independent: {_style = GDGM_IND_commanderStyle };
};

_style;