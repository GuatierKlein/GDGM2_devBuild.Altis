params["_model", "_side", "_dummiesHashMap", "_vehHashMap", "_vehReserves", "_reserves", "_supplies", "_skill"];

private _divisionHashMap = createHashMap;
private _name = "division" + str GDGM_divIndex;

_divisionHashMap set ["name", "division" + str GDGM_divIndex];
_divisionHashMap set ["model", _model];
_divisionHashMap set ["reserves", _reserves];
// _divisionHashMap set ["supplies", _supplies]; //not implemented
_divisionHashMap set ["side", _side];
_divisionHashMap set ["skill", _skill];

//dummmies
_divisionHashMap set ["rifle", _dummiesHashMap get "rifle"];
_divisionHashMap set ["gre", _dummiesHashMap get "gre"];
_divisionHashMap set ["mg", _dummiesHashMap get "mg"];
_divisionHashMap set ["sl", _dummiesHashMap get "sl"];
_divisionHashMap set ["at", _dummiesHashMap get "at"];
_divisionHashMap set ["off", _dummiesHashMap get "off"];
_divisionHashMap set ["sniper", _dummiesHashMap get "sn"];
_divisionHashMap set ["rto", _dummiesHashMap get "rto"];
_divisionHashMap set ["crew", _dummiesHashMap get "crew"];

//vehicles
_divisionHashMap set ["light", _vehHashMap get "lightVeh"];
// _divisionHashMap set ["lightReserves", _vehReserves select 0]; //not used
_divisionHashMap set ["heavy", _vehHashMap get "heavy"];
_divisionHashMap set ["heavyReserves", _vehReserves select 1];
_divisionHashMap set ["transport", _vehHashMap get "transport"];
_divisionHashMap set ["transportReserves", _vehReserves select 0];
_divisionHashMap set ["tank", _vehHashMap get "tank"];
_divisionHashMap set ["tankReserves", _vehReserves select 2];

switch (_side) do {
	case west: { GDGM_BLUFOR_divisions pushBack _divisionHashMap};
	case east: { GDGM_OPFOR_divisions pushBack _divisionHashMap};
	case independent: { GDGM_IND_divisions pushBack _divisionHashMap};
};

GDGM_allDivisions set [_name, _divisionHashMap];
GDGM_divIndex = GDGM_divIndex + 1;


