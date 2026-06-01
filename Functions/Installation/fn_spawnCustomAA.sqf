params ["_pos", "_owner"];

private _aaPool = [];
private _loadoutPool = [];
private _baseUnit = "";

switch (_owner) do {
	case west: { _aaPool = GDGM_BLUFOR_AA; _loadoutPool = GDGM_BLUFOR_rifleDummies; _baseUnit = GDGM_BLUFOR_baseUnit  };
	case east: { _aaPool = GDGM_OPFOR_AA; _loadoutPool = GDGM_OPFOR_rifleDummies; _baseUnit = GDGM_OPFOR_baseUnit};
	case independent: { _aaPool = GDGM_IND_AA; _loadoutPool = GDGM_IND_rifleDummies; _baseUnit = GDGM_IND_baseUnit};
	default { };
};

private _veh = (selectRandom _aaPool) createVehicle (_pos);
_veh setFuel 0;

_newGrp = createGroup [_owner ,true]; 
_unit = _newGrp createUnit [_baseUnit,  _pos, [], 0, "FORM"];
_unit setUnitLoadout getUnitLoadout (selectRandom _loadoutPool);
_unit moveInGunner _veh;
_unit assignAsGunner _veh;

// make marker 
private _marker = createMarker ["AA_position" + str _pos, _pos];
_marker setMarkerTypeLocal "b_antiair";
_marker setMarkerTextLocal "AA Position";

if(_owner == east ) then {
	_marker setMarkerColor "Colorred";
};
if(_owner == west ) then {
	_marker setMarkerColor "Colorblue";
};
if(_owner == resistance ) then {
	_marker setMarkerColor "Colorgreen";
};
