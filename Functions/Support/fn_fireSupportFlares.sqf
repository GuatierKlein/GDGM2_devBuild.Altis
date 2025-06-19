params["_pos","_side"];

private _isArtyFree = false;

switch (_side) do {
	case east: {_isArtyFree = GDGM_isFlareArtyFree_east };
	case west: {_isArtyFree = GDGM_isFlareArtyFree_west };
	case independent: {_isArtyFree = GDGM_isFlareArtyFree_ind };
};

if(!_isArtyFree) exitWith {};

private _cost = 0;
private _stop = false;

_availableSupplies = [_side] call GDGM_fnc_getPoints;

if(_availableSupplies < 10) exitWith {};

[_side, _cost] call GDGM_fnc_addPoints;

switch (_side) do {
	case east: {GDGM_isFlareArtyFree_east = false};
	case west: {GDGM_isFlareArtyFree_west = false};
	case independent: {GDGM_isFlareArtyFree_ind = false };
};

//call in time 
private _callinTime = 30 + floor(random 120);
sleep (_callinTime);

//fire for effect
for [{private _i = 0}, {_i < 5}, {_i = _i + 1}] do {
	// [_pos vectorAdd [0,0,150], "F_40mm_White", 40, 4, 2] spawn BIS_fnc_fireSupportVirtual;
	private _flare1 = "F_40mm_White" createVehicle ((_pos getPos [floor(random 100), floor(random 360)]) vectorAdd [0,0,200]);
	_flare1 setVelocity [0,0,-0.5];
	sleep 1;
	private _flare2 = "F_40mm_White" createVehicle ((_pos getPos [floor(random 100), floor(random 360)]) vectorAdd [0,0,200]);
	_flare2 setVelocity [0,0,-0.5];
	sleep 1;
	private _flare3 = "F_40mm_White" createVehicle ((_pos getPos [floor(random 100), floor(random 360)]) vectorAdd [0,0,200]);
	_flare3 setVelocity [0,0,-0.5];
	sleep 1;
	private _flare4 = "F_40mm_White" createVehicle ((_pos getPos [floor(random 100), floor(random 360)]) vectorAdd [0,0,200]);
	_flare4 setVelocity [0,0,-0.5];

	sleep 60;
};

sleep 330;

switch (_side) do {
	case east: {GDGM_isArtyFree_east = true};
	case west: {GDGM_isArtyFree_west = true};
	case independent: {GDGM_isArtyFree_ind = true };
};