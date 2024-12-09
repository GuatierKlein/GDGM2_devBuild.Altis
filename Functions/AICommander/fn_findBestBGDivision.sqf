params["_division"];

private _bestChoiceBG = [];
private _maxCP = 0;
private _reserves = _division get "reserves";
private _availableVehReserves = [
	_division get "transportReserves",
	_division get "heavyReserves",
	_division get "tankReserves",
	0,
	0
];

{
	private _y = _x;
	private _vehCost = [_y] call GDGM_fnc_convertBGToVehReserveCost;
	if(
		_y select 4 > _maxCP 
		&& _y select 2 <= _reserves 
		&& _y select 2 <= GDGM_maxBGReserve
		&& _vehCost select 0 <= _availableVehReserves select 0
		&& _vehCost select 1 <= _availableVehReserves select 1
		&& _vehCost select 2 <= _availableVehReserves select 2
		&& _vehCost select 3 <= _availableVehReserves select 3
		&& _vehCost select 4 <= _availableVehReserves select 4
	) then {
		_bestChoiceBG = _y;
		_maxCP = _y select 2;
	};	
} forEach GDGM_battlegroupPool;

_bestChoiceBG;

