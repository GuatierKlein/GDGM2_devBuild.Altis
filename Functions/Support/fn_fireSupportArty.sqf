params["_pos","_side", "_caller"];

private _isArtyFree = false;
private _cost = -15;
private _stop = false;

switch (_side) do {
	case east: {_isArtyFree = GDGM_isArtyFree_east };
	case west: {_isArtyFree = GDGM_isArtyFree_west };
	case independent: {_isArtyFree = GDGM_isArtyFree_ind };
};

if(!_isArtyFree) exitWith {};

_availableSupplies = [_side] call GDGM_fnc_getPoints;

if(_availableSupplies < 50) exitWith {};

[_side, _cost] call GDGM_fnc_addPoints;

switch (_side) do {
	case east: {GDGM_isArtyFree_east = false};
	case west: {GDGM_isArtyFree_west = false};
	case independent: {GDGM_isArtyFree_ind = false };
};

//call in time 
private _callinTime = 60 + floor(random 60);
sleep (_callinTime);

//shoot
private _angle = floor(random 360);
private _dist = floor(random 800);
private _transmittedPos = _pos getPos [_dist, _angle];
[_transmittedPos, "Sh_82mm_AMOS", 20, 1, 0] spawn BIS_fnc_fireSupportVirtual;

sleep 45;

while {_transmittedPos distance _pos > 50 && alive _caller} do {

	//test if friendly too close 
	if({side _x == _side} count nearestObjects [_pos,["Man","Car"], 25] > 2) then {
		switch (_side) do {
			case east: {GDGM_isArtyFree_east = true};
			case west: {GDGM_isArtyFree_west = true};
			case independent: {GDGM_isArtyFree_ind = true };
		};
		[_side, _cost] call GDGM_fnc_addPoints;
		_stop = true;
		break;
	};

	//correct
	_dist = _dist * 0.5;
	_transmittedPos = _pos getPos [_dist, _angle];
	//shoot  
	[_transmittedPos, "Sh_82mm_AMOS", 20, 1, 0] spawn BIS_fnc_fireSupportVirtual;
	sleep (30 + floor(random 30));
};

if(_stop) exitWith {};
sleep 20;

//dead caller
if(!alive _caller && _transmittedPos distance _pos < 150) exitWith {
	switch (_side) do {
		case east: {GDGM_isArtyFree_east = true};
		case west: {GDGM_isArtyFree_west = true};
		case independent: {GDGM_isArtyFree_ind = true };
	};
	[_side, _cost] call GDGM_fnc_addPoints;
};



//fire for effect
for [{private _i = 0}, {_i < 6}, {_i = _i + 1}] do {
	[_transmittedPos, "Sh_82mm_AMOS", 40, 4, 0.25] spawn BIS_fnc_fireSupportVirtual;
	sleep (5 + floor(random 2));
};

sleep 600;

switch (_side) do {
	case east: {GDGM_isArtyFree_east = true};
	case west: {GDGM_isArtyFree_west = true};
	case independent: {GDGM_isArtyFree_ind = true };
};