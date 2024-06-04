params["_grp","_side","_arrayToStore","_reserve"];

private _pos = [];
private _spawnPool = [];
private _crewPool = [];
private _baseUnit = [];

switch (_side) do {
	case east: {_pos = getMarkerPos "GDGM_OPFOR_airCorridor"; _spawnPool = GDGM_OPFOR_FighterPlanes; _crewPool = GDGM_OPFOR_CrewDummies; _baseUnit = GDGM_OPFOR_baseUnit};
	case west: {_pos = getMarkerPos "GDGM_BLUFOR_airCorridor"; _spawnPool = GDGM_BLUFOR_FighterPlanes; _crewPool = GDGM_BLUFOR_CrewDummies; _baseUnit = GDGM_BLUFOR_baseUnit};
	case independent: {_pos = getMarkerPos "GDGM_IND_airCorridor"; _spawnPool = GDGM_IND_FighterPlanes; _crewPool = GDGM_IND_CrewDummies; _baseUnit = GDGM_IND_baseUnit};
};

if(count _spawnPool == 0) exitWith {};

private _plane = selectRandom _spawnPool;
private _crewLoadout = selectRandom _crewPool;
private _veh = createVehicle [_plane, _pos, [], 0, "FLY"];
private _crew = _grp createUnit [ _baseUnit, _pos, [], 0, "FORM"];
_crew setUnitLoadout getUnitLoadout _crewLoadout;
_crew moveInDriver _veh;
_crew setRank "LIEUTENANT";

_arrayToStore pushBack _veh;
_arrayToStore pushBack _crew;

if(_reserve) then {
	[_side, [0,0,0,0,-1]] call GDGM_fnc_addVehReserves;
};


