params["_side"];

private _availableSupplies = [_side] call GDGM_fnc_getPoints;
private _availableReserves = [_side] call GDGM_fnc_getReserves;
private _bestChoiceBG = [];
private _maxCP = 0;
private _availableVehReserves = [_side] call GDGM_fnc_getVehReserves;

{
	private _y = _x;
	private _vehCost = [_y] call GDGM_fnc_convertBGToVehReserveCost;
	if(
		_y select 1 <= _availableSupplies 
		&& _y select 4 > _maxCP 
		&& _y select 2 <= _availableReserves 
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

