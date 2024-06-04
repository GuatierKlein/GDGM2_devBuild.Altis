params["_side","_newStyle"];
//serverside 

switch (_side) do {
	case west: {GDGM_BLUFOR_commanderStyle = _newStyle};
	case east: {GDGM_OPFOR_commanderStyle = _newStyle};
	case independent: {GDGM_IND_commanderStyle = _newStyle};
};
