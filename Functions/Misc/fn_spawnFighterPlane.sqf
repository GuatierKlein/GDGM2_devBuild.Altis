params["_grp","_side","_arrayToStore","_reserve","_posOnGround"];

private _pos = [];
private _spawnPool = [];
private _crewPool = [];
private _baseUnit = [];
private _reservePoints = ([_side] call GDGM_fnc_getVehReserves) select 4;

if(_reservePoints < 1) exitWith { systemChat ("GDGM: No fighter planes available for " + str _side); };

switch (_side) do {
	case east: {_pos = getMarkerPos "GDGM_OPFOR_airCorridor"; _spawnPool = GDGM_OPFOR_FighterPlanes; _crewPool = GDGM_OPFOR_CrewDummies; _baseUnit = GDGM_OPFOR_baseUnit};
	case west: {_pos = getMarkerPos "GDGM_BLUFOR_airCorridor"; _spawnPool = GDGM_BLUFOR_FighterPlanes; _crewPool = GDGM_BLUFOR_CrewDummies; _baseUnit = GDGM_BLUFOR_baseUnit};
	case independent: {_pos = getMarkerPos "GDGM_IND_airCorridor"; _spawnPool = GDGM_IND_FighterPlanes; _crewPool = GDGM_IND_CrewDummies; _baseUnit = GDGM_IND_baseUnit};
};

if(count _spawnPool == 0) exitWith { systemChat ("GDGM: No fighter planes available for " + str _side); };

_pos = AGLToASL _pos;
_pos = _pos vectorAdd [0,0,200];
private _spawnType = "FLY";

//if pos on ground then qpawn on ground
if(!isNil "_posOnGround") then {
	_pos = [_posOnGround select 0, _posOnGround select 1, 0];
	_spawnType = "NONE";
};

private _plane = selectRandom _spawnPool;
private _crewLoadout = selectRandom _crewPool;
private _veh = createVehicle [_plane, _pos, [], 0, _spawnType];
private _crew = _grp createUnit [ _baseUnit, _pos, [], 0, "FORM"];
_crew setUnitLoadout getUnitLoadout _crewLoadout;
_crew moveInDriver _veh;
_crew setRank "LIEUTENANT";

//apply pylons if possible
[_veh] call GDGM_fnc_applyPylonsIfPossible;

_arrayToStore pushBack _veh;
_arrayToStore pushBack _crew;

if(_reserve) then {
	[_side, [0,0,0,0,-1]] call GDGM_fnc_addVehReserves;
};


