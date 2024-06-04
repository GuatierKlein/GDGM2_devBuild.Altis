params["_pos","_grp","_side",["_arrayToStore",[]],["_dir",0],["_reserve",false]];

if(_reserve && ([_side] call GDGM_fnc_getVehReserves ) select 2 < 1) exitWith {};

private _unitType = "";
private _unitLoadouts = [];
private _vehPool = [];

//spawn pool  
switch (_side) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit; _unitLoadouts = GDGM_OPFOR_CrewDummies; _vehPool = GDGM_OPFOR_tanks };
	case west: {_unitType = GDGM_BLUFOR_baseUnit; _unitLoadouts = GDGM_BLUFOR_CrewDummies; _vehPool = GDGM_BLUFOR_tanks };
	case independent: {_unitType = GDGM_IND_baseUnit; _unitLoadouts = GDGM_IND_CrewDummies; _vehPool = GDGM_IND_tanks };
};

//spawn veh
_veh = (selectRandom _vehPool) createVehicle (_pos);
_veh setDir _dir;
_arrayToStore pushBack _veh;

//spawn crew 
_unit = _grp createUnit [_unitType,  _pos, [], 0, "FORM"];
_unit setUnitLoadout getUnitLoadout (selectRandom _unitLoadouts);
_unit moveInCommander _veh;
_unit assignAsCommander _veh;
_unit setRank "SERGEANT";
//TODO code to run on unit spawn
_arrayToStore pushBack _unit;


_unit = _grp createUnit [_unitType,  _pos, [], 0, "FORM"];
_unit setUnitLoadout getUnitLoadout (selectRandom _unitLoadouts);
_unit moveInDriver _veh;
_unit assignAsDriver _veh;
//TODO code to run on unit spawn
_arrayToStore pushBack _unit;

_unit = _grp createUnit [_unitType,  _pos, [], 0, "FORM"];
_unit setUnitLoadout getUnitLoadout (selectRandom _unitLoadouts);
_unit moveInGunner _veh;
_unit assignAsGunner _veh;
//TODO code to run on unit spawn
_arrayToStore pushBack _unit;
_grp addVehicle _veh;

_veh setVehicleLock "LOCKED";

[_veh, 0, "tank", _reserve] spawn GDGM_fnc_vehEH;

if(_reserve) then {
	[_side, [0,0,-1,0,0]] call GDGM_fnc_addVehReserves;
};





