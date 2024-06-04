params["_square","_trigger"];

private _middle = _square getVariable "GDGM_middle";
private _side = _square getVariable "GDGM_owner";

private _nbMines = 100;
private _spawnedMines = [];

//mines
for [{private _i = 0}, {_i < _nbMines}, {_i = _i + 1}] do {
	private _mine = createMine ["APERSMine", _middle getPos [floor(random [0, 250, 250]), floor(random 360)], [], 0];
	_side revealMine _mine;
	_spawnedMines pushBack _mine;
};	

//signs
for [{private _i = 0}, {_i < 20}, {_i = _i + 1}] do {
	private _sign = "Land_Sign_MinesTall_English_F" createVehicle (_middle getPos [floor(random [0, 250, 250]), floor(random 360)]);
	_sign setDir floor(random 360);
	_spawnedMines pushBack _sign;
};	

waitUntil { sleep 60; !triggerActivated _trigger; };

{
	deleteVehicle _x;
} forEach _spawnedMines;