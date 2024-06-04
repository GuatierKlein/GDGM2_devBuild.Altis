params["_pos","_grp","_side",["_arrayToStore",[]],["_spawnSquad",false],"_grpSquad",["_reserve",false]];

if(!GDGM_enableHelicopters || (_reserve && [_side] call GDGM_fnc_getReserves < 15)) exitWith {};
private _unitType = "";
private _unitLoadouts = [];
private _vehPool = [];

//spawn pool  
switch (_side) do {
	case east: {_unitType = GDGM_OPFOR_baseUnit; _unitLoadouts = GDGM_OPFOR_CrewDummies; _vehPool = GDGM_OPFOR_transportHelos };
	case west: {_unitType = GDGM_BLUFOR_baseUnit; _unitLoadouts = GDGM_BLUFOR_CrewDummies; _vehPool = GDGM_BLUFOR_transportHelos };
	case independent: {_unitType = GDGM_IND_baseUnit; _unitLoadouts = GDGM_IND_CrewDummies; _vehPool = GDGM_IND_transportHelos };
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
_arrayToStore pushBack _veh;

if(_spawnSquad) then {	

	[_pos, _grpSquad, _side, _arrayToStore, floor((_veh emptyPositions "Cargo") * 0.8), "CARGO", _reserve, _veh] spawn GDGM_fnc_spawnSquad;
};

_grp addVehicle _veh;

[_veh, 30] spawn GDGM_fnc_vehEH;




