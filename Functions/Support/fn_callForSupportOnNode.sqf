params["_node","_side"];

private _pos = _node getVariable "GDGM_position";

private _vehPool = [];

switch (_side) do {
	case east: { _vehPool = GDGM_OPFOR_armedHelos };
	case west: { _vehPool = GDGM_BLUFOR_armedHelos };
	case independent: { _vehPool = GDGM_IND_armedHelos };
};

if(count _vehPool == 0) exitWith {};

if(GDGM_enableHelicopters) then {
	[_pos, _side, "helo"] spawn GDGM_fnc_airSupport;
} else {
	[_pos, _side, "cas"] spawn GDGM_fnc_airSupport;
};