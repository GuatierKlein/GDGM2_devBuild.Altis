params["_pos","_grp","_side","_arrayToStore"];

private _unitType = "";
private _unitLoadouts = [];
private _vehPool = [];
private _array = [];

//spawn pool  
switch (_side) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit; _unitLoadouts = GDGM_OPFOR_rifleDummies; _vehPool = GDGM_OPFOR_patrolBoats };
	case west: {_unitType = GDGM_BLUFOR_baseUnit; _unitLoadouts = GDGM_BLUFOR_rifleDummies; _vehPool = GDGM_BLUFOR_patrolBoats };
	case independent: {_unitType = GDGM_IND_baseUnit; _unitLoadouts = GDGM_IND_rifleDummies; _vehPool = GDGM_IND_patrolBoats };
};

//spawn veh
_veh = (selectRandom _vehPool) createVehicle (_pos);

//spawn crew 
private _crewNb = floor((_veh emptyPositions "Cargo")) max 5;

for [{private _i = 0}, {_i < _crewNb}, {_i = _i + 1}] do {
	_unit = _grp createUnit [_unitType,  _pos, [], 0, "FORM"];
	_unit setUnitLoadout getUnitLoadout (selectRandom _unitLoadouts);
	_unit moveInAny _veh;
	_array pushBack _unit;
	_arrayToStore pushBack _unit;
};

_grp addVehicle _veh;
_arrayToStore pushBack _veh;
[_array,false] spawn GDGM_fnc_soldierEH;