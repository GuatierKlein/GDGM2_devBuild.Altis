params["_pos","_grp","_side","_arrayToStore",["_spawnSquad",false],["_dir",0],["_reserve",false], ["_isDivison", false], ["_divisionName", ""]];

if(_reserve && ([_side] call GDGM_fnc_getVehReserves ) select 1 < 1) exitWith {};

private _unitType = "";
private _unitLoadouts = [];
private _vehPool = [];
private _array = [];
private _division = [];

//spawn pool  
switch (_side) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit; _unitLoadouts = GDGM_OPFOR_CrewDummies; _vehPool = GDGM_OPFOR_heavyArmedVeh };
	case west: {_unitType = GDGM_BLUFOR_baseUnit; _unitLoadouts = GDGM_BLUFOR_CrewDummies; _vehPool = GDGM_BLUFOR_heavyArmedVeh };
	case independent: {_unitType = GDGM_IND_baseUnit; _unitLoadouts = GDGM_IND_CrewDummies; _vehPool = GDGM_IND_heavyArmedVeh };
};

//if division 
if(_isDivison) then {
	_division = GDGM_allDivisions get _divisionName;
	_unitLoadouts = _division get "crew";
	_vehPool = _division get "heavy";
};

//spawn veh
_veh = (selectRandom _vehPool) createVehicle (_pos);

//spawn crew 
_unit = _grp createUnit [_unitType,  _pos, [], 0, "FORM"];
_unit setUnitLoadout getUnitLoadout (selectRandom _unitLoadouts);
_unit moveInDriver _veh;
_unit assignAsDriver _veh;
_unit setRank "SERGEANT";
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
	[_pos, _grp, _side, _arrayToStore, floor((_veh emptyPositions "Cargo") * 0.8), "CARGO",_reserve, _veh, _isDivison, _divisionName] spawn GDGM_fnc_spawnSquad;
};
_arrayToStore pushBack _veh;

if(_reserve) then {
	if(_isDivison) then {
		//crew reserves 
		[_divisionName, -2] call GDGM_fnc_addReserves;
		//veh reserves 
		[_divisionName, [0,-1,0,0,0]] call GDGM_fnc_addVehReserves;
	} else {
		//crew reserves 
		[_side, -2] call GDGM_fnc_addReserves;
		//veh reserves 
		[_side, [0,-1,0,0,0]] call GDGM_fnc_addVehReserves;
	};
};

[_array, _reserve, _isDivison, _divisionName] spawn GDGM_fnc_soldierEH;
[_veh, 0, "apc", _reserve, _isDivison, _divisionName] spawn GDGM_fnc_vehEH;
