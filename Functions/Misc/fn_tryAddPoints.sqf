params["_side", "_amount"];

private _supplies = 0;
private _res = false;

switch (_side) do {
	case west: {_supplies = GDGM_BLUFOR_supplies };
	case east: {_supplies = GDGM_OPFOR_supplies };
	case independent: {_supplies = GDGM_IND_supplies };
};

if(_supplies + _amount > 0) then {
	[_side, _amount] call GDGM_fnc_addPoints;
	_res = true;
};

_res;