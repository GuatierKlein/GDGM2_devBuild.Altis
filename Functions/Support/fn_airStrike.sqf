params["_pos", "_side"];

private _vehPool = [];

switch (_side) do {
	case east: { _vehPool = GDGM_OPFOR_CASPlanes };
	case west: { _vehPool = GDGM_BLUFOR_CASPlanes };
	case independent: { _vehPool = GDGM_IND_CASPlanes };
};

if(count _vehPool == 0) exitWith {};

private _corridorPos = [];

switch (_side) do {
	case east: {GDGM_isCASFree_east = false; _corridorPos = getMarkerPos "GDGM_OPFOR_airCorridor"};
	case west: {GDGM_isCASFree_west = false; _corridorPos = getMarkerPos "GDGM_BLUFOR_airCorridor"};
	case independent: {GDGM_isCASFree_ind = false; _corridorPos = getMarkerPos "GDGM_IND_airCorridor"};
};

private _dir = _corridorPos getDir _pos;

//shoot
_logic = "Logic" createVehicleLocal _pos;
_logic setDir _dir;
_logic setVariable ["vehicle",selectRandom _vehPool];
_logic setVariable ["type",GDGM_planeAttackType];

[_logic,nil,true] call BIS_fnc_moduleCAS;

deleteVehicle _logic;

/*
- _position - array
	    - position for CAS to strike
- _direction - number
	     - direction for the CAS to approach on
- _vehicle - string (optional)
	   - default: "B_Plane_CAS_01_F"
	   - classname of the plane to fly CAS
- _type - number (optional)
	- default: 2
	- type of CAS to be used
		- 0 - Guns
		- 1 - Missiles
		- 2 - Guns & Missiles
		- 3 - Bomb
*/