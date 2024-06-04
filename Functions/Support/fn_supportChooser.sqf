params["_pos","_side","_caller"];

//flares 
if(sunOrMoon == 0 && currentVisionMode _caller == 0) then {
	[_pos, _side] spawn GDGM_fnc_fireSupportFlares;
};

//plane 
private _isCASFree = false;
private _points = [_side] call GDGM_fnc_getPoints;

switch (_side) do {
	case east: {_isCASFree = GDGM_isCASFree_east };
	case west: {_isCASFree = GDGM_isCASFree_west };
	case independent: {_isCASFree = GDGM_isCASFree_ind };
};

if(_isCASFree) then {

	private _reserves = [_side] call GDGM_fnc_getVehReserves;
	

	if(_reserves select 4 > 0 || _points > 75) then {
		private _vehPool = [];

		switch (_side) do {
			case east: { _vehPool = GDGM_OPFOR_CASPlanes };
			case west: { _vehPool = GDGM_BLUFOR_CASPlanes };
			case independent: { _vehPool = GDGM_IND_CASPlanes };
		};

		//test if friendly too close 
		if({side _x == side _caller} count nearestObjects [_pos,["Man","Car","Tank"],50] > 0) exitWith {};

		if(count _vehPool != 0 && random 1 < 0.1) exitWith {[_pos, _side] spawn GDGM_fnc_fireSupportCASPlane;};
	};
};

//mortar
private _isArtyFree = false;

switch (_side) do {
	case east: {_isArtyFree = GDGM_isArtyFree_east };
	case west: {_isArtyFree = GDGM_isArtyFree_west };
	case independent: {_isArtyFree = GDGM_isArtyFree_ind };
};

if(!_isArtyFree || _points < 50) exitWith {};
if(random 1 < 0.25) exitWith {};

//test if friendly too close 
if({side _x == side _caller} count nearestObjects [_pos,["Man","Car","Tank"],50] > 0) exitWith {};
[_pos, _side, _caller] spawn GDGM_fnc_fireSupportArty;