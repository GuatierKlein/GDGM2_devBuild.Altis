params["_pos","_side"];

private _isCASFree = false;

switch (_side) do {
	case east: {_isCASFree = GDGM_isCASFree_east };
	case west: {_isCASFree = GDGM_isCASFree_west };
	case independent: {_isCASFree = GDGM_isCASFree_ind };
};

if(!_isCASFree) exitWith {};

private _reserves = [_side] call GDGM_fnc_getVehReserves;
private _points = [_side] call GDGM_fnc_getPoints;

if(_reserves select 4 < 1 || _points < 50) exitWith {};
// if(count _vehPool == 0) exitWith {};

// [_side, [0,0,0,0,-1]] call GDGM_fnc_addVehReserves;
[_side, -30] call GDGM_fnc_addPoints;

switch (_side) do {
	case east: {GDGM_isCASFree_east = false};
	case west: {GDGM_isCASFree_west = false};
	case independent: {GDGM_isCASFree_ind = false };
};

//call in time 
private _callinTime = 30 + floor(random 60);
sleep (_callinTime);

[_pos, _side] spawn GDGM_fnc_airStrike;

sleep 1800; 

switch (_side) do {
	case east: {GDGM_isCASFree_east = true};
	case west: {GDGM_isCASFree_west = true};
	case independent: {GDGM_isCASFree_ind = true };
};




