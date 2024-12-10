params["_side"];

private _models = [];

switch (_side) do {
	case east: { _models = GDGM_OPFOR_divisionsModels };
	case west: { _models = GDGM_BLUFOR_divisionsModels };
	case independent: { _models = GDGM_IND_divisionsModels };
};

if(count _models == 0) exitWith {systemChat "no models"};

private _divisionModel = selectRandom _models;
_divisionModel call GDGM_fnc_division;

["GDGM_offensive", [[_side] call GDGM_fnc_getFactionName]] remoteExec["BIS_fnc_showNotification", 0];