params["_node" ,"_pos","_amount"];

_craters = [
	"Crater", 
	"Land_ShellCrater_01_F",  
	"Land_ShellCrater_02_large_F", 
	"Land_ShellCrater_02_extralarge_F"
];

private _amount = 20 * _amount;
private _tmpArray = [];
//generate wreck and craters points 
for [{private _i = 0}, {_i < _amount}, {_i = _i + 1}] do {
	private _spawnPos = [_pos, 0, 250, 5, 0, 0.2] call BIS_fnc_findSafePos;
	if(_i mod 2 == 0) then {
		//spawn wreck
		private _veh = createVehicle [selectRandom GDGM_wrecksPool, _spawnPos, [], 0, "CAN_COLLIDE"];
		_tmpArray pushBack _veh;
		_veh setDir (floor(random 360));
		private _veh = createVehicle ["Crater", _spawnPos, [], 0, "CAN_COLLIDE"];
		_tmpArray pushBack _veh;
	} else {
		//spawn crater
		private _type = selectRandom _craters;
		private _veh = createVehicle [_type, _spawnPos, [], 0, "CAN_COLLIDE"];
		_tmpArray pushBack _veh;
		if(_type != "Crater") then {
			private _veh = createVehicle ["Crater", _spawnPos, [], 0, "CAN_COLLIDE"];
			_tmpArray pushBack _veh;
		};		
	};
};

_tmpArray = _tmpArray + (_node getVariable "GDGM_spawnedObjects");
_node setVariable ["GDGM_spawnedObjects",_tmpArray];