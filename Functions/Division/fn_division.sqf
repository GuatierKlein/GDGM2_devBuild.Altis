params["_name", "_side", "_dummiesHashMap", "_vehHashMap", "_reserves", "_supplies"];

private _divisionHashMap = createHashMap;

_divisionHashMap set ["name", _name];
_divisionHashMap set ["reserves", _reserves];
_divisionHashMap set ["supplies", _supplies];
_divisionHashMap set ["side", _side];

//dummmies
_divisionHashMap set ["rifle", _dummiesHashMap get "rifle"];
_divisionHashMap set ["gre", _dummiesHashMap get "gre"];
_divisionHashMap set ["mg", _dummiesHashMap get "mg"];
_divisionHashMap set ["sl", _dummiesHashMap get "sl"];
_divisionHashMap set ["at", _dummiesHashMap get "at"];
_divisionHashMap set ["off", _dummiesHashMap get "off"];
_divisionHashMap set ["sniper", _dummiesHashMap get "sniper"];
_divisionHashMap set ["rto", _dummiesHashMap get "rto"];
_divisionHashMap set ["crew", _dummiesHashMap get "crew"];

//vehicles
_divisionHashMap set ["light", _vehHashMap get "lightVeh"];
_divisionHashMap set ["heavy", _vehHashMap get "heavy"];
_divisionHashMap set ["transport", _vehHashMap get "transport"];
_divisionHashMap set ["tank", _vehHashMap get "tank"];

switch (_side) do {
	case west: { GDGM_BLUFOR_divisions pushBack _divisionHashMap};
	case east: { GDGM_OPFOR_divisions pushBack _divisionHashMap};
	case independent: { GDGM_IND_divisions pushBack _divisionHashMap};
};

GDGM_allDivisions set [_name, _divisionHashMap];


