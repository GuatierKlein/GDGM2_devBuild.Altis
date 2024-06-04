params["_unit","_size"];


private _clientId = owner _unit;

if(!(_unit getUnitTrait "engineer") && _size == "small") exitWith {
	"You need to be an engineer to drop a crate" remoteExec["hint", _clientId];
};

if(_unit getVariable "GDGM_hasDroppedCrate" && _size == "small") exitWith {
	"You have already dropped a supply crate" remoteExec["hint", _clientId];
};

private _crate = objNull;
private _points = 0;
private _cost = 0;
private _dir = getDir _unit;
// private _pos = _unit getPos [1.5, _dir];
private _pos = getPos _unit;

if(_size == "big") then {
	_pos = [ 
		_pos, //trouver une pos sure
		1, //min dist
		10, //max dist
		2, //object dist
		0, //water mode 0=no water
		1, //max grad between 0 and 1
		0, 
		[], 
	[_pos, _pos]] call BIS_fnc_findSafePos;
};

switch (_size) do {
	case "small": {_crate = "Box_Syndicate_Ammo_F" createVehicle _pos; _points = 25; _cost = 5 };
	case "big": {_crate = "B_CargoNet_01_ammo_F" createVehicle _pos; _points = 500; _cost = 50 };
};

if(([side _unit] call GDGM_fnc_getPoints) - _cost < 0) exitWith {
	private _msg = "You don't have enough supply to spawn a supplies crate, you need " + str _cost;
	_msg remoteExec["hint", _clientId];
};

"Spawning logistic crate..." remoteExec["hint", _clientId];

[side _unit, -_cost] call GDGM_fnc_addPoints;
_unit setVariable ["GDGM_hasDroppedCrate", _size == "small", true];
[_crate, _points, _unit] spawn GDGM_fnc_makeLogiCrate;


