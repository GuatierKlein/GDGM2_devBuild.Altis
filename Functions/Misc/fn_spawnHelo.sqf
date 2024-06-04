params["_pos","_grp","_side",["_arrayToStore",[]], ["_reserve", false]];

if(!GDGM_enableHelicopters) exitWith {};
private _unitType = "";
private _unitLoadouts = [];
private _vehPool = [];

//spawn pool  
switch (_side) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit; _unitLoadouts = GDGM_OPFOR_CrewDummies; _vehPool = GDGM_OPFOR_armedHelos };
	case west: {_unitType = GDGM_BLUFOR_baseUnit; _unitLoadouts = GDGM_BLUFOR_CrewDummies; _vehPool = GDGM_BLUFOR_armedHelos };
	case independent: {_unitType = GDGM_IND_baseUnit; _unitLoadouts = GDGM_IND_CrewDummies; _vehPool = GDGM_IND_armedHelos };
};

//spawn veh
//_veh = (selectRandom _vehPool) createVehicle (_pos);
_veh = createVehicle [(selectRandom _vehPool), _pos, [], 0, "FLY"];
//_veh setPosATL (_pos vectorAdd [0,0,100]);

//spawn crew 
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
_arrayToStore pushBack _veh;

_grp addVehicle _veh;

[_veh, 50] spawn GDGM_fnc_vehEH;

// if(_reserve) then {
// 	[_side, [0,0,0,0,-1]] call GDGM_fnc_addVehReserves;
// };




