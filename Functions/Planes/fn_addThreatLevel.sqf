params["_side","_amount"];

private _currentLevel = 0;

switch (_side) do {
	case east: { _currentLevel = GDGM_planeRaid_OPFOR_threatLevel };
	case west: { _currentLevel = GDGM_planeRaid_BLUFOR_threatLevel };
	case independent: { _currentLevel = GDGM_planeRaid_IND_threatLevel };
	default { };
};

if(_currentLevel + _amount < 0 || _currentLevel + _amount > 5) exitWith {};

switch (_side) do {
	case east: { GDGM_planeRaid_OPFOR_threatLevel = GDGM_planeRaid_OPFOR_threatLevel + _amount };
	case west: { GDGM_planeRaid_BLUFOR_threatLevel = GDGM_planeRaid_BLUFOR_threatLevel + _amount };
	case independent: { GDGM_planeRaid_IND_threatLevel = GDGM_planeRaid_IND_threatLevel + _amount };
	default { };
};

private _msg = [_side] call GDGM_fnc_getFactionName;

if(_currentLevel + _amount > ceil _currentLevel) then {
	if(_amount > 0) then {
		// _msg = _msg + ": air threat level increased!";
		["GDGM_airThreat",[_msg]] remoteExec["BIS_fnc_showNotification", 0];
	} else {
		_msg = _msg + ": air threat level decreased!";
	};
	_msg remoteExec ["systemChat", 0];
};



