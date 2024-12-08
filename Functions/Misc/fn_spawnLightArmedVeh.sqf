params["_pos","_grp","_side","_arrayToStore",["_spawnSquad",false],["_dir",0],["_reserve",false], ["_isDivison", false], ["_divisionName", ""]];

private _unitType = "";
private _unitLoadouts = [];
private _vehPool = [];
private _array = [];
private _division = [];

//spawn pool  
switch (_side) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit; _unitLoadouts = GDGM_OPFOR_rifleDummies; _vehPool = GDGM_OPFOR_lightArmedVeh };
	case west: {_unitType = GDGM_BLUFOR_baseUnit; _unitLoadouts = GDGM_BLUFOR_rifleDummies; _vehPool = GDGM_BLUFOR_lightArmedVeh };
	case independent: {_unitType = GDGM_IND_baseUnit; _unitLoadouts = GDGM_IND_rifleDummies; _vehPool = GDGM_IND_lightArmedVeh };
};

//if division 
if(_isDivison) then {
	_division = GDGM_allDivisions get _divisionName;
	_unitLoadouts = _division get "rifle";
	_vehPool = _division get "light";
};

//spawn veh
_veh = (selectRandom _vehPool) createVehicle (_pos);

//spawn crew 
_unit = _grp createUnit [_unitType,  _pos, [], 0, "FORM"];
_unit setUnitLoadout getUnitLoadout (selectRandom _unitLoadouts);
_unit moveInDriver _veh;
_unit assignAsDriver _veh;
//TODO code to run on unit spawn
_arrayToStore pushBack _unit;
_array pushBack _unit;	

_unit = _grp createUnit [_unitType,  _pos, [], 0, "FORM"];
_veh setDir _dir;

_unit setUnitLoadout getUnitLoadout (selectRandom _unitLoadouts);
_unit moveInGunner _veh;
_unit assignAsGunner _veh;
//TODO code to run on unit spawn
_arrayToStore pushBack _unit;
_array pushBack _unit;

_grp addVehicle _veh;

if(_spawnSquad) then {	
	[_pos, _grp, _side, _arrayToStore, floor((_veh emptyPositions "Cargo")), "CARGO",_reserve, _veh, _isDivison, _divisionName] spawn GDGM_fnc_spawnSquad;
};
_arrayToStore pushBack _veh;

	if(_reserve) then {
		if(_isDivison) then {
			[_divisionName, -2] call GDGM_fnc_addReserves;
		} else {
			[_side, -2] call GDGM_fnc_addReserves;
		};
	};	

[_array, _reserve] spawn GDGM_fnc_soldierEH;
[_veh, 10] spawn GDGM_fnc_vehEH;
[_grp, false, true] spawn GDGM_fnc_groupEH;
