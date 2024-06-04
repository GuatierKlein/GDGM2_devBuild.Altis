params["_side","_amount"];

private _current = 0;

switch (_side) do {
	case east: { _current = GDGM_planeRaid_OPFOR_spawnedPlanes };
	case west: { _current = GDGM_planeRaid_BLUFOR_spawnedPlanes };
	case independent: { _current = GDGM_planeRaid_IND_spawnedPlanes };
	default { };
};

if(_current + _amount < 0) exitWith {};

switch (_side) do {
	case east: { GDGM_planeRaid_OPFOR_spawnedPlanes = _current + _amount };
	case west: { GDGM_planeRaid_BLUFOR_spawnedPlanes = _current + _amount };
	case independent: { GDGM_planeRaid_IND_spawnedPlanes = _current + _amount };
	default { };
};

